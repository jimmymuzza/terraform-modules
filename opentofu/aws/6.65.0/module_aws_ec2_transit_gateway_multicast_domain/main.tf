resource "aws_ec2_transit_gateway_multicast_domain" "ec2_transit_gateway_multicast_domains" {
  for_each = var.ec2_transit_gateway_multicast_domains

  transit_gateway_id              = each.value.transit_gateway_id
  auto_accept_shared_associations = each.value.auto_accept_shared_associations
  igmpv2_support                  = each.value.igmpv2_support
  region                          = each.value.region
  static_sources_support          = each.value.static_sources_support
  tags                            = each.value.tags
  tags_all                        = each.value.tags_all
}
