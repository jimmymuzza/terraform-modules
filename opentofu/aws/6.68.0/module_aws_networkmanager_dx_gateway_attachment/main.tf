resource "aws_networkmanager_dx_gateway_attachment" "networkmanager_dx_gateway_attachments" {
  for_each = var.networkmanager_dx_gateway_attachments

  core_network_id            = each.value.core_network_id
  direct_connect_gateway_arn = each.value.direct_connect_gateway_arn
  edge_locations             = each.value.edge_locations
  routing_policy_label       = each.value.routing_policy_label
  tags                       = each.value.tags
}
