resource "aws_ec2_client_vpn_authorization_rule" "ec2_client_vpn_authorization_rules" {
  for_each = var.ec2_client_vpn_authorization_rules

  client_vpn_endpoint_id = each.value.client_vpn_endpoint_id
  target_network_cidr    = each.value.target_network_cidr
  access_group_id        = each.value.access_group_id
  authorize_all_groups   = each.value.authorize_all_groups
  description            = each.value.description
  region                 = each.value.region
}
