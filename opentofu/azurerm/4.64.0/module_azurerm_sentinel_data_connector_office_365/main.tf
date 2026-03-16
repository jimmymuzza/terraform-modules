resource "azurerm_sentinel_data_connector_office_365" "sentinel_data_connector_office_365s" {
  for_each = var.sentinel_data_connector_office_365s

  log_analytics_workspace_id = each.value.log_analytics_workspace_id
  name                       = each.value.name
  exchange_enabled           = each.value.exchange_enabled
  sharepoint_enabled         = each.value.sharepoint_enabled
  teams_enabled              = each.value.teams_enabled
  tenant_id                  = each.value.tenant_id
}
