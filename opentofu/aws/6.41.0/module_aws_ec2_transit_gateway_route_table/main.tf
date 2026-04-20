resource "aws_ec2_transit_gateway_route_table" "ec2_transit_gateway_route_tables" {
  for_each = var.ec2_transit_gateway_route_tables

  transit_gateway_id = each.value.transit_gateway_id
  region             = each.value.region
  tags               = each.value.tags
  tags_all           = each.value.tags_all
}
