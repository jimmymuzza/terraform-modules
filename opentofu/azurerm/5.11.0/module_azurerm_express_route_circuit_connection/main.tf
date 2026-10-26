resource "azurerm_express_route_circuit_connection" "express_route_circuit_connections" {
  for_each = var.express_route_circuit_connections

  address_prefix_ipv4 = each.value.address_prefix_ipv4
  name                = each.value.name
  peer_peering_id     = each.value.peer_peering_id
  peering_id          = each.value.peering_id
  address_prefix_ipv6 = each.value.address_prefix_ipv6
  authorization_key   = each.value.authorization_key
}
