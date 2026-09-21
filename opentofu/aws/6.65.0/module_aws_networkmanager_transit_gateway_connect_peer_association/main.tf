resource "aws_networkmanager_transit_gateway_connect_peer_association" "networkmanager_transit_gateway_connect_peer_associations" {
  for_each = var.networkmanager_transit_gateway_connect_peer_associations

  device_id                        = each.value.device_id
  global_network_id                = each.value.global_network_id
  transit_gateway_connect_peer_arn = each.value.transit_gateway_connect_peer_arn
  link_id                          = each.value.link_id
}
