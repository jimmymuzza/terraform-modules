resource "azurerm_log_analytics_workspace_table" "log_analytics_workspace_tables" {
  for_each = var.log_analytics_workspace_tables

  name                    = each.value.name
  workspace_id            = each.value.workspace_id
  plan                    = each.value.plan
  retention_in_days       = each.value.retention_in_days
  total_retention_in_days = each.value.total_retention_in_days
}
