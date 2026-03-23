resource "azurerm_nat_gateway" "nat_gateways" {
  for_each = var.nat_gateways

  location                = each.value.location
  name                    = each.value.name
  resource_group_name     = each.value.resource_group_name
  idle_timeout_in_minutes = each.value.idle_timeout_in_minutes
  sku_name                = each.value.sku_name
  tags                    = each.value.tags
  zones                   = each.value.zones
}
