resource "aws_ec2_transit_gateway_metering_policy" "ec2_transit_gateway_metering_policies" {
  for_each = var.ec2_transit_gateway_metering_policies

  transit_gateway_id       = each.value.transit_gateway_id
  middlebox_attachment_ids = each.value.middlebox_attachment_ids
  region                   = each.value.region
  tags                     = each.value.tags
}
