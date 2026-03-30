resource "azurerm_express_route_circuit_peering" "express_route_circuit_peerings" {
  for_each = var.express_route_circuit_peerings

  express_route_circuit_name    = each.value.express_route_circuit_name
  peering_type                  = each.value.peering_type
  resource_group_name           = each.value.resource_group_name
  vlan_id                       = each.value.vlan_id
  ipv4_enabled                  = each.value.ipv4_enabled
  peer_asn                      = each.value.peer_asn
  primary_peer_address_prefix   = each.value.primary_peer_address_prefix
  route_filter_id               = each.value.route_filter_id
  secondary_peer_address_prefix = each.value.secondary_peer_address_prefix
  shared_key                    = each.value.shared_key

  dynamic "ipv6" {
    for_each = each.value.ipv6 != null ? each.value.ipv6 : []
    content {
      primary_peer_address_prefix   = ipv6.value.primary_peer_address_prefix
      secondary_peer_address_prefix = ipv6.value.secondary_peer_address_prefix
      enabled                       = ipv6.value.enabled
      route_filter_id               = ipv6.value.route_filter_id

      dynamic "microsoft_peering" {
        for_each = ipv6.value.microsoft_peering != null ? ipv6.value.microsoft_peering : []
        content {
          advertised_communities     = microsoft_peering.value.advertised_communities
          advertised_public_prefixes = microsoft_peering.value.advertised_public_prefixes
          customer_asn               = microsoft_peering.value.customer_asn
          routing_registry_name      = microsoft_peering.value.routing_registry_name
        }
      }
    }
  }

  dynamic "microsoft_peering_config" {
    for_each = each.value.microsoft_peering_config != null ? each.value.microsoft_peering_config : []
    content {
      advertised_public_prefixes = microsoft_peering_config.value.advertised_public_prefixes
      advertised_communities     = microsoft_peering_config.value.advertised_communities
      customer_asn               = microsoft_peering_config.value.customer_asn
      routing_registry_name      = microsoft_peering_config.value.routing_registry_name
    }
  }
}
