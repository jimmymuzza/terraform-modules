resource "azurerm_subnet_nat_gateway_association" "subnet_nat_gateway_associations" {
  for_each = var.subnet_nat_gateway_associations

  nat_gateway_id = each.value.nat_gateway_id
  subnet_id      = each.value.subnet_id
}
