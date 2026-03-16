resource "azurerm_app_service_hybrid_connection" "app_service_hybrid_connections" {
  for_each = var.app_service_hybrid_connections

  app_service_name    = each.value.app_service_name
  hostname            = each.value.hostname
  port                = each.value.port
  relay_id            = each.value.relay_id
  resource_group_name = each.value.resource_group_name
  send_key_name       = each.value.send_key_name
}
