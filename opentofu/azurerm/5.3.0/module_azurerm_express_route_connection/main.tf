resource "azurerm_express_route_connection" "express_route_connections" {
  for_each = var.express_route_connections

  express_route_circuit_peering_id     = each.value.express_route_circuit_peering_id
  express_route_gateway_id             = each.value.express_route_gateway_id
  name                                 = each.value.name
  authorization_key                    = each.value.authorization_key
  express_route_gateway_bypass_enabled = each.value.express_route_gateway_bypass_enabled
  internet_security_enabled            = each.value.internet_security_enabled
  routing_weight                       = each.value.routing_weight

  dynamic "routing" {
    for_each = each.value.routing != null ? each.value.routing : []
    content {
      associated_route_table_id = routing.value.associated_route_table_id
      inbound_route_map_id      = routing.value.inbound_route_map_id
      outbound_route_map_id     = routing.value.outbound_route_map_id

      dynamic "propagated_route_table" {
        for_each = routing.value.propagated_route_table != null ? routing.value.propagated_route_table : []
        content {
          labels          = propagated_route_table.value.labels
          route_table_ids = propagated_route_table.value.route_table_ids
        }
      }
    }
  }
}
