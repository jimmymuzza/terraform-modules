resource "azurerm_lb_probe" "lb_probes" {
  for_each = var.lb_probes

  loadbalancer_id              = each.value.loadbalancer_id
  name                         = each.value.name
  port                         = each.value.port
  interval_in_seconds          = each.value.interval_in_seconds
  no_healthy_backends_behavior = each.value.no_healthy_backends_behavior
  number_of_probes             = each.value.number_of_probes
  probe_threshold              = each.value.probe_threshold
  protocol                     = each.value.protocol
  request_path                 = each.value.request_path
}
