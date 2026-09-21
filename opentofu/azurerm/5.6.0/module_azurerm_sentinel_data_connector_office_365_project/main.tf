resource "azurerm_sentinel_data_connector_office_365_project" "sentinel_data_connector_office_365_projects" {
  for_each = var.sentinel_data_connector_office_365_projects

  log_analytics_workspace_id = each.value.log_analytics_workspace_id
  name                       = each.value.name
  tenant_id                  = each.value.tenant_id
}
