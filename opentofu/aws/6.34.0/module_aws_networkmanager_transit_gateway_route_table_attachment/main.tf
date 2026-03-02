resource "aws_networkmanager_transit_gateway_route_table_attachment" "networkmanager_transit_gateway_route_table_attachments" {
  for_each = var.networkmanager_transit_gateway_route_table_attachments

  peering_id                      = each.value.peering_id
  transit_gateway_route_table_arn = each.value.transit_gateway_route_table_arn
  routing_policy_label            = each.value.routing_policy_label
  tags                            = each.value.tags
  tags_all                        = each.value.tags_all
}
