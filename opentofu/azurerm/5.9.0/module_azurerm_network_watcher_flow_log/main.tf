resource "azurerm_network_watcher_flow_log" "network_watcher_flow_logs" {
  for_each = var.network_watcher_flow_logs

  enabled              = each.value.enabled
  name                 = each.value.name
  network_watcher_name = each.value.network_watcher_name
  resource_group_name  = each.value.resource_group_name
  storage_account_id   = each.value.storage_account_id
  target_resource_id   = each.value.target_resource_id
  location             = each.value.location
  tags                 = each.value.tags
  version              = each.value.version

  dynamic "retention_policy" {
    for_each = each.value.retention_policy != null ? each.value.retention_policy : []
    content {
      days    = retention_policy.value.days
      enabled = retention_policy.value.enabled
    }
  }

  dynamic "traffic_analytics" {
    for_each = each.value.traffic_analytics != null ? each.value.traffic_analytics : []
    content {
      enabled               = traffic_analytics.value.enabled
      workspace_id          = traffic_analytics.value.workspace_id
      workspace_region      = traffic_analytics.value.workspace_region
      workspace_resource_id = traffic_analytics.value.workspace_resource_id
      interval_in_minutes   = traffic_analytics.value.interval_in_minutes
    }
  }
}
