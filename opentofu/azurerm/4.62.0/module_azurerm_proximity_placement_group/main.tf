resource "azurerm_proximity_placement_group" "proximity_placement_groups" {
  for_each = var.proximity_placement_groups

  location            = each.value.location
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  allowed_vm_sizes    = each.value.allowed_vm_sizes
  tags                = each.value.tags
  zone                = each.value.zone
}
