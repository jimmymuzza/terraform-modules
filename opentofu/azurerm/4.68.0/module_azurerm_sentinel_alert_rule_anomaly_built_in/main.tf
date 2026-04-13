resource "azurerm_sentinel_alert_rule_anomaly_built_in" "sentinel_alert_rule_anomaly_built_ins" {
  for_each = var.sentinel_alert_rule_anomaly_built_ins

  enabled                    = each.value.enabled
  log_analytics_workspace_id = each.value.log_analytics_workspace_id
  mode                       = each.value.mode
  display_name               = each.value.display_name
  name                       = each.value.name
}
