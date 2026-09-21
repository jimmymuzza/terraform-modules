resource "azurerm_capacity_reservation_group" "capacity_reservation_groups" {
  for_each = var.capacity_reservation_groups

  location            = each.value.location
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  tags                = each.value.tags
  zones               = each.value.zones
}
