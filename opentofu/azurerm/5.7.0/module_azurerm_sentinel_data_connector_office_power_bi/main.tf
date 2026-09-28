resource "azurerm_sentinel_data_connector_office_power_bi" "sentinel_data_connector_office_power_bis" {
  for_each = var.sentinel_data_connector_office_power_bis

  log_analytics_workspace_id = each.value.log_analytics_workspace_id
  name                       = each.value.name
  tenant_id                  = each.value.tenant_id
}
