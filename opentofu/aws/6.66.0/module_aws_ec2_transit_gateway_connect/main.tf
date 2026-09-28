resource "aws_ec2_transit_gateway_connect" "ec2_transit_gateway_connects" {
  for_each = var.ec2_transit_gateway_connects

  transit_gateway_id                              = each.value.transit_gateway_id
  transport_attachment_id                         = each.value.transport_attachment_id
  protocol                                        = each.value.protocol
  region                                          = each.value.region
  tags                                            = each.value.tags
  tags_all                                        = each.value.tags_all
  transit_gateway_default_route_table_association = each.value.transit_gateway_default_route_table_association
  transit_gateway_default_route_table_propagation = each.value.transit_gateway_default_route_table_propagation
}
