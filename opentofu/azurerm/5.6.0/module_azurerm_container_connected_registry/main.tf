resource "azurerm_container_connected_registry" "container_connected_registries" {
  for_each = var.container_connected_registries

  container_registry_id = each.value.container_registry_id
  name                  = each.value.name
  sync_token_id         = each.value.sync_token_id
  audit_log_enabled     = each.value.audit_log_enabled
  client_token_ids      = each.value.client_token_ids
  log_level             = each.value.log_level
  mode                  = each.value.mode
  parent_registry_id    = each.value.parent_registry_id
  sync_message_ttl      = each.value.sync_message_ttl
  sync_schedule         = each.value.sync_schedule
  sync_window           = each.value.sync_window

  dynamic "notification" {
    for_each = each.value.notification != null ? each.value.notification : []
    content {
      action = notification.value.action
      name   = notification.value.name
      digest = notification.value.digest
      tag    = notification.value.tag
    }
  }
}
