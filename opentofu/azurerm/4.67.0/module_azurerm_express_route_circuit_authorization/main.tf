resource "azurerm_express_route_circuit_authorization" "express_route_circuit_authorizations" {
  for_each = var.express_route_circuit_authorizations

  express_route_circuit_name = each.value.express_route_circuit_name
  name                       = each.value.name
  resource_group_name        = each.value.resource_group_name
}
