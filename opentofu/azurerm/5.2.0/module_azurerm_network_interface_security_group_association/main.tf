resource "azurerm_network_interface_security_group_association" "network_interface_security_group_associations" {
  for_each = var.network_interface_security_group_associations

  network_interface_id      = each.value.network_interface_id
  network_security_group_id = each.value.network_security_group_id
}
