resource "azurerm_sentinel_data_connector_microsoft_defender_advanced_threat_protection" "sentinel_data_connector_microsoft_defender_advanced_threat_protections" {
  for_each = var.sentinel_data_connector_microsoft_defender_advanced_threat_protections

  log_analytics_workspace_id = each.value.log_analytics_workspace_id
  name                       = each.value.name
  tenant_id                  = each.value.tenant_id
}
