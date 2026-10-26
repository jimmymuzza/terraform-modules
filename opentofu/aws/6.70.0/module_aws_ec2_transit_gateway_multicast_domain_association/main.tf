resource "aws_ec2_transit_gateway_multicast_domain_association" "ec2_transit_gateway_multicast_domain_associations" {
  for_each = var.ec2_transit_gateway_multicast_domain_associations

  subnet_id                           = each.value.subnet_id
  transit_gateway_attachment_id       = each.value.transit_gateway_attachment_id
  transit_gateway_multicast_domain_id = each.value.transit_gateway_multicast_domain_id
  region                              = each.value.region
}
