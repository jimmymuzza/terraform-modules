resource "aws_ec2_transit_gateway_policy_table_association" "ec2_transit_gateway_policy_table_associations" {
  for_each = var.ec2_transit_gateway_policy_table_associations

  transit_gateway_attachment_id   = each.value.transit_gateway_attachment_id
  transit_gateway_policy_table_id = each.value.transit_gateway_policy_table_id
  region                          = each.value.region
}
