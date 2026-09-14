resource "aws_networkmanager_connect_peer" "networkmanager_connect_peers" {
  for_each = var.networkmanager_connect_peers

  connect_attachment_id = each.value.connect_attachment_id
  peer_address          = each.value.peer_address
  core_network_address  = each.value.core_network_address
  inside_cidr_blocks    = each.value.inside_cidr_blocks
  subnet_arn            = each.value.subnet_arn
  tags                  = each.value.tags
  tags_all              = each.value.tags_all

  dynamic "bgp_options" {
    for_each = each.value.bgp_options != null ? each.value.bgp_options : []
    content {
      peer_asn = bgp_options.value.peer_asn
    }
  }
}
