resource "azurerm_recovery_services_vault_resource_guard_association" "recovery_services_vault_resource_guard_associations" {
  for_each = var.recovery_services_vault_resource_guard_associations

  resource_guard_id = each.value.resource_guard_id
  vault_id          = each.value.vault_id
}
