resource "aws_globalaccelerator_endpoint_group" "globalaccelerator_endpoint_groups" {
  for_each = var.globalaccelerator_endpoint_groups

  listener_arn                  = each.value.listener_arn
  endpoint_group_region         = each.value.endpoint_group_region
  health_check_interval_seconds = each.value.health_check_interval_seconds
  health_check_path             = each.value.health_check_path
  health_check_port             = each.value.health_check_port
  health_check_protocol         = each.value.health_check_protocol
  threshold_count               = each.value.threshold_count
  traffic_dial_percentage       = each.value.traffic_dial_percentage

  dynamic "endpoint_configuration" {
    for_each = each.value.endpoint_configuration != null ? each.value.endpoint_configuration : []
    content {
      attachment_arn                 = endpoint_configuration.value.attachment_arn
      client_ip_preservation_enabled = endpoint_configuration.value.client_ip_preservation_enabled
      endpoint_id                    = endpoint_configuration.value.endpoint_id
      weight                         = endpoint_configuration.value.weight
    }
  }

  dynamic "port_override" {
    for_each = each.value.port_override != null ? each.value.port_override : []
    content {
      endpoint_port = port_override.value.endpoint_port
      listener_port = port_override.value.listener_port
    }
  }
}
