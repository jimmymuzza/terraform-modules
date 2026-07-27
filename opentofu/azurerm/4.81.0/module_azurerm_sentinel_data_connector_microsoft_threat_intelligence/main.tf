resource "azurerm_sentinel_data_connector_microsoft_threat_intelligence" "sentinel_data_connector_microsoft_threat_intelligences" {
  for_each = var.sentinel_data_connector_microsoft_threat_intelligences

  log_analytics_workspace_id                   = each.value.log_analytics_workspace_id
  microsoft_emerging_threat_feed_lookback_date = each.value.microsoft_emerging_threat_feed_lookback_date
  name                                         = each.value.name
  tenant_id                                    = each.value.tenant_id
}
