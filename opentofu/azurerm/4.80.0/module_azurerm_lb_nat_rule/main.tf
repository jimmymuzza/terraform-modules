resource "azurerm_lb_nat_rule" "lb_nat_rules" {
  for_each = var.lb_nat_rules

  backend_port                   = each.value.backend_port
  frontend_ip_configuration_name = each.value.frontend_ip_configuration_name
  loadbalancer_id                = each.value.loadbalancer_id
  name                           = each.value.name
  protocol                       = each.value.protocol
  resource_group_name            = each.value.resource_group_name
  backend_address_pool_id        = each.value.backend_address_pool_id
  enable_floating_ip             = each.value.enable_floating_ip
  enable_tcp_reset               = each.value.enable_tcp_reset
  floating_ip_enabled            = each.value.floating_ip_enabled
  frontend_port                  = each.value.frontend_port
  frontend_port_end              = each.value.frontend_port_end
  frontend_port_start            = each.value.frontend_port_start
  idle_timeout_in_minutes        = each.value.idle_timeout_in_minutes
  tcp_reset_enabled              = each.value.tcp_reset_enabled
}
