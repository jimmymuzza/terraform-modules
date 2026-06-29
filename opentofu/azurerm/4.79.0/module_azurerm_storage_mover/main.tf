resource "azurerm_storage_mover" "storage_movers" {
  for_each = var.storage_movers

  location            = each.value.location
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  description         = each.value.description
  tags                = each.value.tags
}
