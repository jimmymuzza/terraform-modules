resource "aws_vpn_connection_route" "vpn_connection_routes" {
  for_each = var.vpn_connection_routes

  destination_cidr_block = each.value.destination_cidr_block
  vpn_connection_id      = each.value.vpn_connection_id
  region                 = each.value.region
}
