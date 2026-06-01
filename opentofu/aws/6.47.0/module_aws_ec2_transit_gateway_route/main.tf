resource "aws_ec2_transit_gateway_route" "ec2_transit_gateway_routes" {
  for_each = var.ec2_transit_gateway_routes

  destination_cidr_block         = each.value.destination_cidr_block
  transit_gateway_route_table_id = each.value.transit_gateway_route_table_id
  blackhole                      = each.value.blackhole
  region                         = each.value.region
  transit_gateway_attachment_id  = each.value.transit_gateway_attachment_id
}
