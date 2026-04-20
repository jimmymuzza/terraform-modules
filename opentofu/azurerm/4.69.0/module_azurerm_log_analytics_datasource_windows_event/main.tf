resource "azurerm_log_analytics_datasource_windows_event" "log_analytics_datasource_windows_events" {
  for_each = var.log_analytics_datasource_windows_events

  event_log_name      = each.value.event_log_name
  event_types         = each.value.event_types
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  workspace_name      = each.value.workspace_name
}
