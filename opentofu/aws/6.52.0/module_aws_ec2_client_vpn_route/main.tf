resource "aws_ec2_client_vpn_route" "ec2_client_vpn_routes" {
  for_each = var.ec2_client_vpn_routes

  client_vpn_endpoint_id = each.value.client_vpn_endpoint_id
  destination_cidr_block = each.value.destination_cidr_block
  target_vpc_subnet_id   = each.value.target_vpc_subnet_id
  description            = each.value.description
  region                 = each.value.region
}
