resource "azurerm_sentinel_data_connector_azure_security_center" "sentinel_data_connector_azure_security_centers" {
  for_each = var.sentinel_data_connector_azure_security_centers

  log_analytics_workspace_id = each.value.log_analytics_workspace_id
  name                       = each.value.name
  subscription_id            = each.value.subscription_id
}
