resource "azurerm_sentinel_watchlist" "sentinel_watchlists" {
  for_each = var.sentinel_watchlists

  display_name               = each.value.display_name
  item_search_key            = each.value.item_search_key
  log_analytics_workspace_id = each.value.log_analytics_workspace_id
  name                       = each.value.name
  default_duration           = each.value.default_duration
  description                = each.value.description
  labels                     = each.value.labels
}
