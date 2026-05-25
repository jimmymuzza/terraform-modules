resource "azurerm_sentinel_data_connector_threat_intelligence" "sentinel_data_connector_threat_intelligences" {
  for_each = var.sentinel_data_connector_threat_intelligences

  log_analytics_workspace_id = each.value.log_analytics_workspace_id
  name                       = each.value.name
  lookback_date              = each.value.lookback_date
  tenant_id                  = each.value.tenant_id
}
