resource "aws_globalaccelerator_listener" "globalaccelerator_listeners" {
  for_each = var.globalaccelerator_listeners

  accelerator_arn = each.value.accelerator_arn
  protocol        = each.value.protocol
  client_affinity = each.value.client_affinity

  dynamic "port_range" {
    for_each = each.value.port_range != null ? each.value.port_range : []
    content {
      from_port = port_range.value.from_port
      to_port   = port_range.value.to_port
    }
  }
}
