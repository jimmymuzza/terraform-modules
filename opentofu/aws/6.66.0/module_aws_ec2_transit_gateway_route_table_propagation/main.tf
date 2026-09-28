resource "aws_ec2_transit_gateway_route_table_propagation" "ec2_transit_gateway_route_table_propagations" {
  for_each = var.ec2_transit_gateway_route_table_propagations

  transit_gateway_attachment_id  = each.value.transit_gateway_attachment_id
  transit_gateway_route_table_id = each.value.transit_gateway_route_table_id
  region                         = each.value.region
}
