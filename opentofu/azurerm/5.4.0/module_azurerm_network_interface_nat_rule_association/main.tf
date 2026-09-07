resource "azurerm_network_interface_nat_rule_association" "network_interface_nat_rule_associations" {
  for_each = var.network_interface_nat_rule_associations

  ip_configuration_name = each.value.ip_configuration_name
  nat_rule_id           = each.value.nat_rule_id
  network_interface_id  = each.value.network_interface_id
}
