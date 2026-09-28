resource "azurerm_lb_backend_address_pool_address" "lb_backend_address_pool_addresses" {
  for_each = var.lb_backend_address_pool_addresses

  backend_address_pool_id             = each.value.backend_address_pool_id
  name                                = each.value.name
  backend_address_ip_configuration_id = each.value.backend_address_ip_configuration_id
  ip_address                          = each.value.ip_address
  virtual_network_id                  = each.value.virtual_network_id
}
