resource "azurerm_sentinel_alert_rule_machine_learning_behavior_analytics" "sentinel_alert_rule_machine_learning_behavior_analytics" {
  for_each = var.sentinel_alert_rule_machine_learning_behavior_analytics

  alert_rule_template_guid   = each.value.alert_rule_template_guid
  log_analytics_workspace_id = each.value.log_analytics_workspace_id
  name                       = each.value.name
  enabled                    = each.value.enabled
}
