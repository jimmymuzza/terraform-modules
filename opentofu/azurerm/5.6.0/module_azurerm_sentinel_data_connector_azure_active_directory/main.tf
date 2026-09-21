resource "azurerm_sentinel_data_connector_azure_active_directory" "sentinel_data_connector_azure_active_directories" {
  for_each = var.sentinel_data_connector_azure_active_directories

  log_analytics_workspace_id = each.value.log_analytics_workspace_id
  name                       = each.value.name
  tenant_id                  = each.value.tenant_id
}
