resource "azurerm_network_watcher" "network_watchers" {
  for_each = var.network_watchers

  location            = each.value.location
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  tags                = each.value.tags
}
