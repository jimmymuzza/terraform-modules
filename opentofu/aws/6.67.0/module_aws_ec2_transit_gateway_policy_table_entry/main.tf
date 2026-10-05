resource "aws_ec2_transit_gateway_policy_table_entry" "ec2_transit_gateway_policy_table_entries" {
  for_each = var.ec2_transit_gateway_policy_table_entries

  policy_rule_number              = each.value.policy_rule_number
  target_route_table_id           = each.value.target_route_table_id
  transit_gateway_policy_table_id = each.value.transit_gateway_policy_table_id
  region                          = each.value.region

  dynamic "policy_rule" {
    for_each = each.value.policy_rule != null ? each.value.policy_rule : []
    content {
      destination_cidr_block = policy_rule.value.destination_cidr_block
      destination_port_range = policy_rule.value.destination_port_range
      protocol               = policy_rule.value.protocol
      source_cidr_block      = policy_rule.value.source_cidr_block
      source_port_range      = policy_rule.value.source_port_range

      dynamic "metadata" {
        for_each = policy_rule.value.metadata != null ? policy_rule.value.metadata : []
        content {
          key   = metadata.value.key
          value = metadata.value.value
        }
      }
    }
  }
}
