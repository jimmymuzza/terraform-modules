resource "azurerm_disk_access" "disk_accesses" {
  for_each = var.disk_accesses

  location            = each.value.location
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  tags                = each.value.tags
}
