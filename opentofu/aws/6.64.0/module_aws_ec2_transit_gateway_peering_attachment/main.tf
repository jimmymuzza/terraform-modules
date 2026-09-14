resource "aws_ec2_transit_gateway_peering_attachment" "ec2_transit_gateway_peering_attachments" {
  for_each = var.ec2_transit_gateway_peering_attachments

  peer_region             = each.value.peer_region
  peer_transit_gateway_id = each.value.peer_transit_gateway_id
  transit_gateway_id      = each.value.transit_gateway_id
  peer_account_id         = each.value.peer_account_id
  region                  = each.value.region
  tags                    = each.value.tags
  tags_all                = each.value.tags_all

  dynamic "options" {
    for_each = each.value.options != null ? each.value.options : []
    content {
      dynamic_routing = options.value.dynamic_routing
    }
  }
}
