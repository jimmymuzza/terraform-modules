resource "azurerm_local_network_gateway" "local_network_gateways" {
  for_each = var.local_network_gateways

  location            = each.value.location
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  address_space       = each.value.address_space
  gateway_address     = each.value.gateway_address
  gateway_fqdn        = each.value.gateway_fqdn
  tags                = each.value.tags

  dynamic "bgp_settings" {
    for_each = each.value.bgp_settings != null ? each.value.bgp_settings : []
    content {
      asn                 = bgp_settings.value.asn
      bgp_peering_address = bgp_settings.value.bgp_peering_address
      peer_weight         = bgp_settings.value.peer_weight
    }
  }
}
