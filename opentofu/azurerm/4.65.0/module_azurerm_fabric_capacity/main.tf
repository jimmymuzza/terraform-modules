resource "azurerm_fabric_capacity" "fabric_capacities" {
  for_each = var.fabric_capacities

  location               = each.value.location
  name                   = each.value.name
  resource_group_name    = each.value.resource_group_name
  administration_members = each.value.administration_members
  tags                   = each.value.tags

  dynamic "sku" {
    for_each = each.value.sku != null ? each.value.sku : []
    content {
      name = sku.value.name
      tier = sku.value.tier
    }
  }
}
