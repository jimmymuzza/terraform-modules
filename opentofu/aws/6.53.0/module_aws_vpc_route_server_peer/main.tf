resource "aws_vpc_route_server_peer" "vpc_route_server_peers" {
  for_each = var.vpc_route_server_peers

  peer_address             = each.value.peer_address
  route_server_endpoint_id = each.value.route_server_endpoint_id
  region                   = each.value.region
  tags                     = each.value.tags

  dynamic "bgp_options" {
    for_each = each.value.bgp_options != null ? each.value.bgp_options : []
    content {
      peer_asn                = bgp_options.value.peer_asn
      peer_liveness_detection = bgp_options.value.peer_liveness_detection
    }
  }
}
