resource "azurerm_blueprint_assignment" "blueprint_assignments" {
  for_each = var.blueprint_assignments

  location                = each.value.location
  name                    = each.value.name
  target_subscription_id  = each.value.target_subscription_id
  version_id              = each.value.version_id
  lock_exclude_actions    = each.value.lock_exclude_actions
  lock_exclude_principals = each.value.lock_exclude_principals
  lock_mode               = each.value.lock_mode
  parameter_values        = each.value.parameter_values
  resource_groups         = each.value.resource_groups

  dynamic "identity" {
    for_each = each.value.identity != null ? each.value.identity : []
    content {
      type         = identity.value.type
      identity_ids = identity.value.identity_ids
    }
  }
}
