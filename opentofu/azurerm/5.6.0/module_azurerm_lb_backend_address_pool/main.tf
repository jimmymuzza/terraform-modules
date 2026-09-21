resource "azurerm_lb_backend_address_pool" "lb_backend_address_pools" {
  for_each = var.lb_backend_address_pools

  loadbalancer_id    = each.value.loadbalancer_id
  name               = each.value.name
  synchronous_mode   = each.value.synchronous_mode
  virtual_network_id = each.value.virtual_network_id

  dynamic "tunnel_interface" {
    for_each = each.value.tunnel_interface != null ? each.value.tunnel_interface : []
    content {
      identifier = tunnel_interface.value.identifier
      port       = tunnel_interface.value.port
      protocol   = tunnel_interface.value.protocol
      type       = tunnel_interface.value.type
    }
  }
}
