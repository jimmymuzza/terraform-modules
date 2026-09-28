resource "aws_ec2_client_vpn_network_association" "ec2_client_vpn_network_associations" {
  for_each = var.ec2_client_vpn_network_associations

  client_vpn_endpoint_id = each.value.client_vpn_endpoint_id
  subnet_id              = each.value.subnet_id
  region                 = each.value.region
}
