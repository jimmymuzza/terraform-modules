resource "aws_globalaccelerator_custom_routing_endpoint_group" "globalaccelerator_custom_routing_endpoint_groups" {
  for_each = var.globalaccelerator_custom_routing_endpoint_groups

  listener_arn          = each.value.listener_arn
  endpoint_group_region = each.value.endpoint_group_region

  dynamic "destination_configuration" {
    for_each = each.value.destination_configuration != null ? each.value.destination_configuration : []
    content {
      from_port = destination_configuration.value.from_port
      protocols = destination_configuration.value.protocols
      to_port   = destination_configuration.value.to_port
    }
  }

  dynamic "endpoint_configuration" {
    for_each = each.value.endpoint_configuration != null ? each.value.endpoint_configuration : []
    content {
      endpoint_id = endpoint_configuration.value.endpoint_id
    }
  }
}
