resource "azurerm_log_analytics_data_export_rule" "log_analytics_data_export_rules" {
  for_each = var.log_analytics_data_export_rules

  destination_resource_id = each.value.destination_resource_id
  name                    = each.value.name
  resource_group_name     = each.value.resource_group_name
  table_names             = each.value.table_names
  workspace_resource_id   = each.value.workspace_resource_id
  enabled                 = each.value.enabled
}
