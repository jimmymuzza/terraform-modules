resource "aws_ec2_transit_gateway" "ec2_transit_gateways" {
  for_each = var.ec2_transit_gateways

  amazon_side_asn                    = each.value.amazon_side_asn
  auto_accept_shared_attachments     = each.value.auto_accept_shared_attachments
  default_route_table_association    = each.value.default_route_table_association
  default_route_table_propagation    = each.value.default_route_table_propagation
  description                        = each.value.description
  dns_support                        = each.value.dns_support
  encryption_support                 = each.value.encryption_support
  multicast_support                  = each.value.multicast_support
  region                             = each.value.region
  security_group_referencing_support = each.value.security_group_referencing_support
  tags                               = each.value.tags
  tags_all                           = each.value.tags_all
  transit_gateway_cidr_blocks        = each.value.transit_gateway_cidr_blocks
  vpn_ecmp_support                   = each.value.vpn_ecmp_support
}
