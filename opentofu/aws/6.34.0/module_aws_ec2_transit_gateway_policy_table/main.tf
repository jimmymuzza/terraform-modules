resource "aws_ec2_transit_gateway_policy_table" "ec2_transit_gateway_policy_tables" {
  for_each = var.ec2_transit_gateway_policy_tables

  transit_gateway_id = each.value.transit_gateway_id
  region             = each.value.region
  tags               = each.value.tags
  tags_all           = each.value.tags_all
}
