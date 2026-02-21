resource "azurerm_subnet_network_security_group_association" "subnet_network_security_group_associations" {
  for_each = var.subnet_network_security_group_associations

  network_security_group_id = each.value.network_security_group_id
  subnet_id                 = each.value.subnet_id
}
