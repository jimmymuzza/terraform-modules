resource "azurerm_route_table" "route_tables" {
  for_each = var.route_tables

  location                      = each.value.location
  name                          = each.value.name
  resource_group_name           = each.value.resource_group_name
  bgp_route_propagation_enabled = each.value.bgp_route_propagation_enabled
  route                         = each.value.route
  tags                          = each.value.tags
}
