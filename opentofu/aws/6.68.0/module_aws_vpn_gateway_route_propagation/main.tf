resource "aws_vpn_gateway_route_propagation" "vpn_gateway_route_propagations" {
  for_each = var.vpn_gateway_route_propagations

  route_table_id = each.value.route_table_id
  vpn_gateway_id = each.value.vpn_gateway_id
  region         = each.value.region
}
