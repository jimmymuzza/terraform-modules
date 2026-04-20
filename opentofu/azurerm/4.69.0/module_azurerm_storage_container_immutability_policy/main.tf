resource "azurerm_storage_container_immutability_policy" "storage_container_immutability_policies" {
  for_each = var.storage_container_immutability_policies

  immutability_period_in_days           = each.value.immutability_period_in_days
  storage_container_resource_manager_id = each.value.storage_container_resource_manager_id
  locked                                = each.value.locked
  protected_append_writes_all_enabled   = each.value.protected_append_writes_all_enabled
  protected_append_writes_enabled       = each.value.protected_append_writes_enabled
}
