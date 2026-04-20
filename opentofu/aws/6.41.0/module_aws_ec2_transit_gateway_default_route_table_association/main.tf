resource "aws_ec2_transit_gateway_default_route_table_association" "ec2_transit_gateway_default_route_table_associations" {
  for_each = var.ec2_transit_gateway_default_route_table_associations

  transit_gateway_id             = each.value.transit_gateway_id
  transit_gateway_route_table_id = each.value.transit_gateway_route_table_id
  region                         = each.value.region
}
