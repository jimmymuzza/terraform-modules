resource "azurerm_lb_nat_pool" "lb_nat_pools" {
  for_each = var.lb_nat_pools

  backend_port                   = each.value.backend_port
  frontend_ip_configuration_name = each.value.frontend_ip_configuration_name
  frontend_port_end              = each.value.frontend_port_end
  frontend_port_start            = each.value.frontend_port_start
  loadbalancer_id                = each.value.loadbalancer_id
  name                           = each.value.name
  protocol                       = each.value.protocol
  resource_group_name            = each.value.resource_group_name
  floating_ip_enabled            = each.value.floating_ip_enabled
  idle_timeout_in_minutes        = each.value.idle_timeout_in_minutes
  tcp_reset_enabled              = each.value.tcp_reset_enabled
}
