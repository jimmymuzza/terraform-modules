resource "azurerm_log_analytics_workspace_table_microsoft" "log_analytics_workspace_table_microsofts" {
  for_each = var.log_analytics_workspace_table_microsofts

  name                    = each.value.name
  workspace_id            = each.value.workspace_id
  description             = each.value.description
  display_name            = each.value.display_name
  labels                  = each.value.labels
  retention_in_days       = each.value.retention_in_days
  total_retention_in_days = each.value.total_retention_in_days

  dynamic "column" {
    for_each = each.value.column != null ? each.value.column : []
    content {
      name               = column.value.name
      type               = column.value.type
      description        = column.value.description
      display_by_default = column.value.display_by_default
      display_name       = column.value.display_name
      hidden             = column.value.hidden
    }
  }
}
