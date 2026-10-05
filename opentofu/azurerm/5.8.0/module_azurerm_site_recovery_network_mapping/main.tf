resource "azurerm_site_recovery_network_mapping" "site_recovery_network_mappings" {
  for_each = var.site_recovery_network_mappings

  name                        = each.value.name
  recovery_vault_name         = each.value.recovery_vault_name
  resource_group_name         = each.value.resource_group_name
  source_network_id           = each.value.source_network_id
  source_recovery_fabric_name = each.value.source_recovery_fabric_name
  target_network_id           = each.value.target_network_id
  target_recovery_fabric_name = each.value.target_recovery_fabric_name
}
