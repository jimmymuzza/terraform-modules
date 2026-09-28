resource "azurerm_sentinel_data_connector_office_irm" "sentinel_data_connector_office_irms" {
  for_each = var.sentinel_data_connector_office_irms

  log_analytics_workspace_id = each.value.log_analytics_workspace_id
  name                       = each.value.name
  tenant_id                  = each.value.tenant_id
}
