resource "azurerm_network_manager_admin_rule_collection" "network_manager_admin_rule_collections" {
  for_each = var.network_manager_admin_rule_collections

  name                            = each.value.name
  network_group_ids               = each.value.network_group_ids
  security_admin_configuration_id = each.value.security_admin_configuration_id
  description                     = each.value.description
}
