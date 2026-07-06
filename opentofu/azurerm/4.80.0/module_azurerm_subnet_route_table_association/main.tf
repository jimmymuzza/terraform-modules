resource "azurerm_subnet_route_table_association" "subnet_route_table_associations" {
  for_each = var.subnet_route_table_associations

  route_table_id = each.value.route_table_id
  subnet_id      = each.value.subnet_id
}
