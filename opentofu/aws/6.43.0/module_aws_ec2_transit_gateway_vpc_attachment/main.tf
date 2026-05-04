resource "aws_ec2_transit_gateway_vpc_attachment" "ec2_transit_gateway_vpc_attachments" {
  for_each = var.ec2_transit_gateway_vpc_attachments

  subnet_ids                                      = each.value.subnet_ids
  transit_gateway_id                              = each.value.transit_gateway_id
  vpc_id                                          = each.value.vpc_id
  appliance_mode_support                          = each.value.appliance_mode_support
  dns_support                                     = each.value.dns_support
  ipv6_support                                    = each.value.ipv6_support
  region                                          = each.value.region
  security_group_referencing_support              = each.value.security_group_referencing_support
  tags                                            = each.value.tags
  tags_all                                        = each.value.tags_all
  transit_gateway_default_route_table_association = each.value.transit_gateway_default_route_table_association
  transit_gateway_default_route_table_propagation = each.value.transit_gateway_default_route_table_propagation
}
