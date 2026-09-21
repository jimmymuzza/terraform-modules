resource "azurerm_route_filter" "route_filters" {
  for_each = var.route_filters

  location            = each.value.location
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  rule                = each.value.rule
  tags                = each.value.tags
}
