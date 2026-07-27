resource "aws_ec2_transit_gateway_multicast_group_source" "ec2_transit_gateway_multicast_group_sources" {
  for_each = var.ec2_transit_gateway_multicast_group_sources

  group_ip_address                    = each.value.group_ip_address
  network_interface_id                = each.value.network_interface_id
  transit_gateway_multicast_domain_id = each.value.transit_gateway_multicast_domain_id
  region                              = each.value.region
}
