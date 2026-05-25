resource "azurerm_sentinel_data_connector_dynamics_365" "sentinel_data_connector_dynamics_365s" {
  for_each = var.sentinel_data_connector_dynamics_365s

  log_analytics_workspace_id = each.value.log_analytics_workspace_id
  name                       = each.value.name
  tenant_id                  = each.value.tenant_id
}
