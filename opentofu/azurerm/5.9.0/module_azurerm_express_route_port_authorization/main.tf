resource "azurerm_express_route_port_authorization" "express_route_port_authorizations" {
  for_each = var.express_route_port_authorizations

  express_route_port_name = each.value.express_route_port_name
  name                    = each.value.name
  resource_group_name     = each.value.resource_group_name
}
