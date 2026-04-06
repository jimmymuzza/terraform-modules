resource "azurerm_site_recovery_hyperv_network_mapping" "site_recovery_hyperv_network_mappings" {
  for_each = var.site_recovery_hyperv_network_mappings

  name                                              = each.value.name
  recovery_vault_id                                 = each.value.recovery_vault_id
  source_network_name                               = each.value.source_network_name
  source_system_center_virtual_machine_manager_name = each.value.source_system_center_virtual_machine_manager_name
  target_network_id                                 = each.value.target_network_id
}
