resource "aws_globalaccelerator_custom_routing_listener" "globalaccelerator_custom_routing_listeners" {
  for_each = var.globalaccelerator_custom_routing_listeners

  accelerator_arn = each.value.accelerator_arn

  dynamic "port_range" {
    for_each = each.value.port_range != null ? each.value.port_range : []
    content {
      from_port = port_range.value.from_port
      to_port   = port_range.value.to_port
    }
  }
}
