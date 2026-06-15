resource "azurerm_route" "routes" {
  for_each = var.routes

  address_prefix         = each.value.address_prefix
  name                   = each.value.name
  next_hop_type          = each.value.next_hop_type
  resource_group_name    = each.value.resource_group_name
  route_table_name       = each.value.route_table_name
  next_hop_in_ip_address = each.value.next_hop_in_ip_address
}
