resource "aws_ec2_transit_gateway_metering_policy_entry" "ec2_transit_gateway_metering_policy_entries" {
  for_each = var.ec2_transit_gateway_metering_policy_entries

  metered_account                             = each.value.metered_account
  policy_rule_number                          = each.value.policy_rule_number
  transit_gateway_metering_policy_id          = each.value.transit_gateway_metering_policy_id
  destination_cidr_block                      = each.value.destination_cidr_block
  destination_port_range                      = each.value.destination_port_range
  destination_transit_gateway_attachment_id   = each.value.destination_transit_gateway_attachment_id
  destination_transit_gateway_attachment_type = each.value.destination_transit_gateway_attachment_type
  protocol                                    = each.value.protocol
  region                                      = each.value.region
  source_cidr_block                           = each.value.source_cidr_block
  source_port_range                           = each.value.source_port_range
  source_transit_gateway_attachment_id        = each.value.source_transit_gateway_attachment_id
  source_transit_gateway_attachment_type      = each.value.source_transit_gateway_attachment_type
}
