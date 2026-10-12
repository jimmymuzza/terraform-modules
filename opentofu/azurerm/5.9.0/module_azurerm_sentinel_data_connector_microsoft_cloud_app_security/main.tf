resource "azurerm_sentinel_data_connector_microsoft_cloud_app_security" "sentinel_data_connector_microsoft_cloud_app_securities" {
  for_each = var.sentinel_data_connector_microsoft_cloud_app_securities

  log_analytics_workspace_id = each.value.log_analytics_workspace_id
  name                       = each.value.name
  alerts_enabled             = each.value.alerts_enabled
  discovery_logs_enabled     = each.value.discovery_logs_enabled
  tenant_id                  = each.value.tenant_id
}
