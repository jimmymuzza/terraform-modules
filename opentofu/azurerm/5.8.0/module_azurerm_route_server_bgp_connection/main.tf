resource "azurerm_route_server_bgp_connection" "route_server_bgp_connections" {
  for_each = var.route_server_bgp_connections

  name            = each.value.name
  peer_asn        = each.value.peer_asn
  peer_ip         = each.value.peer_ip
  route_server_id = each.value.route_server_id
}
