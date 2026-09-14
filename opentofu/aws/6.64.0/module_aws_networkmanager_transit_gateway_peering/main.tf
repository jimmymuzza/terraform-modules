resource "aws_networkmanager_transit_gateway_peering" "networkmanager_transit_gateway_peerings" {
  for_each = var.networkmanager_transit_gateway_peerings

  core_network_id     = each.value.core_network_id
  transit_gateway_arn = each.value.transit_gateway_arn
  tags                = each.value.tags
  tags_all            = each.value.tags_all
}
