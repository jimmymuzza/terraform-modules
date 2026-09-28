resource "azurerm_virtual_hub_bgp_connection" "virtual_hub_bgp_connections" {
  for_each = var.virtual_hub_bgp_connections

  name                          = each.value.name
  peer_asn                      = each.value.peer_asn
  peer_ip                       = each.value.peer_ip
  virtual_hub_id                = each.value.virtual_hub_id
  virtual_network_connection_id = each.value.virtual_network_connection_id
}
