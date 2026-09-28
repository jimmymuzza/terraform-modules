resource "azurerm_log_analytics_datasource_windows_performance_counter" "log_analytics_datasource_windows_performance_counters" {
  for_each = var.log_analytics_datasource_windows_performance_counters

  counter_name        = each.value.counter_name
  instance_name       = each.value.instance_name
  interval_seconds    = each.value.interval_seconds
  name                = each.value.name
  object_name         = each.value.object_name
  resource_group_name = each.value.resource_group_name
  workspace_name      = each.value.workspace_name
}
