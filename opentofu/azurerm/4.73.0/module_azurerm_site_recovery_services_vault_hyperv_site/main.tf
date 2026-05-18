resource "azurerm_site_recovery_services_vault_hyperv_site" "site_recovery_services_vault_hyperv_sites" {
  for_each = var.site_recovery_services_vault_hyperv_sites

  name              = each.value.name
  recovery_vault_id = each.value.recovery_vault_id
}
