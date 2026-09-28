resource "azurerm_sentinel_watchlist_item" "sentinel_watchlist_items" {
  for_each = var.sentinel_watchlist_items

  properties   = each.value.properties
  watchlist_id = each.value.watchlist_id
  name         = each.value.name
}
