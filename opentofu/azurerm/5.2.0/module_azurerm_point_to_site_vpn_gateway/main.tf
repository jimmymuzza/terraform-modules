resource "azurerm_point_to_site_vpn_gateway" "point_to_site_vpn_gateways" {
  for_each = var.point_to_site_vpn_gateways

  location                            = each.value.location
  name                                = each.value.name
  resource_group_name                 = each.value.resource_group_name
  scale_unit                          = each.value.scale_unit
  virtual_hub_id                      = each.value.virtual_hub_id
  vpn_server_configuration_id         = each.value.vpn_server_configuration_id
  dns_servers                         = each.value.dns_servers
  routing_preference_internet_enabled = each.value.routing_preference_internet_enabled
  tags                                = each.value.tags

  dynamic "connection_configuration" {
    for_each = each.value.connection_configuration != null ? each.value.connection_configuration : []
    content {
      name                      = connection_configuration.value.name
      internet_security_enabled = connection_configuration.value.internet_security_enabled

      dynamic "route" {
        for_each = connection_configuration.value.route != null ? connection_configuration.value.route : []
        content {
          associated_route_table_id = route.value.associated_route_table_id
          inbound_route_map_id      = route.value.inbound_route_map_id
          outbound_route_map_id     = route.value.outbound_route_map_id

          dynamic "propagated_route_table" {
            for_each = route.value.propagated_route_table != null ? route.value.propagated_route_table : []
            content {
              ids    = propagated_route_table.value.ids
              labels = propagated_route_table.value.labels
            }
          }
        }
      }

      dynamic "vpn_client_address_pool" {
        for_each = connection_configuration.value.vpn_client_address_pool != null ? connection_configuration.value.vpn_client_address_pool : []
        content {
          address_prefixes = vpn_client_address_pool.value.address_prefixes
        }
      }
    }
  }
}
