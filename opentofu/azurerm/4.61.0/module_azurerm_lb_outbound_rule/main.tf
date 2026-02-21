resource "azurerm_lb_outbound_rule" "lb_outbound_rules" {
  for_each = var.lb_outbound_rules

  backend_address_pool_id  = each.value.backend_address_pool_id
  loadbalancer_id          = each.value.loadbalancer_id
  name                     = each.value.name
  protocol                 = each.value.protocol
  allocated_outbound_ports = each.value.allocated_outbound_ports
  enable_tcp_reset         = each.value.enable_tcp_reset
  idle_timeout_in_minutes  = each.value.idle_timeout_in_minutes
  tcp_reset_enabled        = each.value.tcp_reset_enabled

  dynamic "frontend_ip_configuration" {
    for_each = each.value.frontend_ip_configuration != null ? each.value.frontend_ip_configuration : []
    content {
      name = frontend_ip_configuration.value.name
    }
  }
}
