resource "azurerm_sentinel_data_connector_iot" "sentinel_data_connector_iots" {
  for_each = var.sentinel_data_connector_iots

  log_analytics_workspace_id = each.value.log_analytics_workspace_id
  name                       = each.value.name
  subscription_id            = each.value.subscription_id
}
