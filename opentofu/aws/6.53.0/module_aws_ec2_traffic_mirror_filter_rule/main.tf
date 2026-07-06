resource "aws_ec2_traffic_mirror_filter_rule" "ec2_traffic_mirror_filter_rules" {
  for_each = var.ec2_traffic_mirror_filter_rules

  destination_cidr_block   = each.value.destination_cidr_block
  rule_action              = each.value.rule_action
  rule_number              = each.value.rule_number
  source_cidr_block        = each.value.source_cidr_block
  traffic_direction        = each.value.traffic_direction
  traffic_mirror_filter_id = each.value.traffic_mirror_filter_id
  description              = each.value.description
  protocol                 = each.value.protocol
  region                   = each.value.region

  dynamic "destination_port_range" {
    for_each = each.value.destination_port_range != null ? each.value.destination_port_range : []
    content {
      from_port = destination_port_range.value.from_port
      to_port   = destination_port_range.value.to_port
    }
  }

  dynamic "source_port_range" {
    for_each = each.value.source_port_range != null ? each.value.source_port_range : []
    content {
      from_port = source_port_range.value.from_port
      to_port   = source_port_range.value.to_port
    }
  }
}
