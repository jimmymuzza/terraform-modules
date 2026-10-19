resource "azurerm_site_recovery_protection_container" "site_recovery_protection_containers" {
  for_each = var.site_recovery_protection_containers

  name                 = each.value.name
  recovery_fabric_name = each.value.recovery_fabric_name
  recovery_vault_name  = each.value.recovery_vault_name
  resource_group_name  = each.value.resource_group_name
}
