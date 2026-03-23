resource "aws_ec2_transit_gateway_vpc_attachment_accepter" "ec2_transit_gateway_vpc_attachment_accepters" {
  for_each = var.ec2_transit_gateway_vpc_attachment_accepters

  transit_gateway_attachment_id                   = each.value.transit_gateway_attachment_id
  region                                          = each.value.region
  tags                                            = each.value.tags
  tags_all                                        = each.value.tags_all
  transit_gateway_default_route_table_association = each.value.transit_gateway_default_route_table_association
  transit_gateway_default_route_table_propagation = each.value.transit_gateway_default_route_table_propagation
}
