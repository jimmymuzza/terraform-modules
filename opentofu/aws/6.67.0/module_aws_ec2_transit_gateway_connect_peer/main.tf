resource "aws_ec2_transit_gateway_connect_peer" "ec2_transit_gateway_connect_peers" {
  for_each = var.ec2_transit_gateway_connect_peers

  inside_cidr_blocks            = each.value.inside_cidr_blocks
  peer_address                  = each.value.peer_address
  transit_gateway_attachment_id = each.value.transit_gateway_attachment_id
  bgp_asn                       = each.value.bgp_asn
  region                        = each.value.region
  tags                          = each.value.tags
  tags_all                      = each.value.tags_all
  transit_gateway_address       = each.value.transit_gateway_address
}
