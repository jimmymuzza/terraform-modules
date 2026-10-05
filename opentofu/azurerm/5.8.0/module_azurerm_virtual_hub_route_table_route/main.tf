resource "azurerm_virtual_hub_route_table_route" "virtual_hub_route_table_routes" {
  for_each = var.virtual_hub_route_table_routes

  destinations      = each.value.destinations
  destinations_type = each.value.destinations_type
  name              = each.value.name
  next_hop          = each.value.next_hop
  route_table_id    = each.value.route_table_id
  next_hop_type     = each.value.next_hop_type
}
