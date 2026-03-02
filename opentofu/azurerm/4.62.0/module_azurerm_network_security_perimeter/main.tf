resource "azurerm_network_security_perimeter" "network_security_perimeters" {
  for_each = var.network_security_perimeters

  location            = each.value.location
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  tags                = each.value.tags
}
