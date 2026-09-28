resource "azurerm_sentinel_data_connector_threat_intelligence_taxii" "sentinel_data_connector_threat_intelligence_taxiis" {
  for_each = var.sentinel_data_connector_threat_intelligence_taxiis

  api_root_url               = each.value.api_root_url
  collection_id              = each.value.collection_id
  display_name               = each.value.display_name
  log_analytics_workspace_id = each.value.log_analytics_workspace_id
  name                       = each.value.name
  lookback_date              = each.value.lookback_date
  password                   = each.value.password
  polling_frequency          = each.value.polling_frequency
  tenant_id                  = each.value.tenant_id
  user_name                  = each.value.user_name
}
