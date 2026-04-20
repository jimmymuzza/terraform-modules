resource "azurerm_lb_rule" "lb_rules" {
  for_each = var.lb_rules

  backend_port                   = each.value.backend_port
  frontend_ip_configuration_name = each.value.frontend_ip_configuration_name
  frontend_port                  = each.value.frontend_port
  loadbalancer_id                = each.value.loadbalancer_id
  name                           = each.value.name
  protocol                       = each.value.protocol
  backend_address_pool_ids       = each.value.backend_address_pool_ids
  disable_outbound_snat          = each.value.disable_outbound_snat
  enable_floating_ip             = each.value.enable_floating_ip
  enable_tcp_reset               = each.value.enable_tcp_reset
  floating_ip_enabled            = each.value.floating_ip_enabled
  idle_timeout_in_minutes        = each.value.idle_timeout_in_minutes
  load_distribution              = each.value.load_distribution
  probe_id                       = each.value.probe_id
  tcp_reset_enabled              = each.value.tcp_reset_enabled
}
