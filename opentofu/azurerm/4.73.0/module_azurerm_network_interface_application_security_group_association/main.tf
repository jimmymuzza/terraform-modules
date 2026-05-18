resource "azurerm_network_interface_application_security_group_association" "network_interface_application_security_group_associations" {
  for_each = var.network_interface_application_security_group_associations

  application_security_group_id = each.value.application_security_group_id
  network_interface_id          = each.value.network_interface_id
}
