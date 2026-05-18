resource "azurerm_nat_gateway_public_ip_prefix_association" "nat_gateway_public_ip_prefix_associations" {
  for_each = var.nat_gateway_public_ip_prefix_associations

  nat_gateway_id      = each.value.nat_gateway_id
  public_ip_prefix_id = each.value.public_ip_prefix_id
}
