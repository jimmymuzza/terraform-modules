resource "azurerm_network_interface_backend_address_pool_association" "network_interface_backend_address_pool_associations" {
  for_each = var.network_interface_backend_address_pool_associations

  backend_address_pool_id = each.value.backend_address_pool_id
  ip_configuration_name   = each.value.ip_configuration_name
  network_interface_id    = each.value.network_interface_id
}
