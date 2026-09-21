resource "azurerm_log_analytics_workspace_table_custom_log" "log_analytics_workspace_table_custom_logs" {
  for_each = var.log_analytics_workspace_table_custom_logs

  name                    = each.value.name
  workspace_id            = each.value.workspace_id
  description             = each.value.description
  display_name            = each.value.display_name
  plan                    = each.value.plan
  retention_in_days       = each.value.retention_in_days
  total_retention_in_days = each.value.total_retention_in_days

  dynamic "column" {
    for_each = each.value.column != null ? each.value.column : []
    content {
      name         = column.value.name
      type         = column.value.type
      description  = column.value.description
      display_name = column.value.display_name
    }
  }
}
