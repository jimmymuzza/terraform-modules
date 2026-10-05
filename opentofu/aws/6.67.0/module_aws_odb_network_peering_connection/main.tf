resource "aws_odb_network_peering_connection" "odb_network_peering_connections" {
  for_each = var.odb_network_peering_connections

  display_name       = each.value.display_name
  peer_network_id    = each.value.peer_network_id
  odb_network_arn    = each.value.odb_network_arn
  odb_network_id     = each.value.odb_network_id
  peer_network_cidrs = each.value.peer_network_cidrs
  region             = each.value.region
  tags               = each.value.tags
}
