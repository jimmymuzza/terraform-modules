resource "azurerm_monitor_alert_prometheus_rule_group" "monitor_alert_prometheus_rule_groups" {
  for_each = var.monitor_alert_prometheus_rule_groups

  location            = each.value.location
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  scopes              = each.value.scopes
  cluster_name        = each.value.cluster_name
  description         = each.value.description
  interval            = each.value.interval
  rule_group_enabled  = each.value.rule_group_enabled
  tags                = each.value.tags

  dynamic "rule" {
    for_each = each.value.rule != null ? each.value.rule : []
    content {
      expression  = rule.value.expression
      alert       = rule.value.alert
      annotations = rule.value.annotations
      enabled     = rule.value.enabled
      for         = rule.value.for
      labels      = rule.value.labels
      record      = rule.value.record
      severity    = rule.value.severity

      dynamic "action" {
        for_each = rule.value.action != null ? rule.value.action : []
        content {
          action_group_id   = action.value.action_group_id
          action_properties = action.value.action_properties
        }
      }

      dynamic "alert_resolution" {
        for_each = rule.value.alert_resolution != null ? rule.value.alert_resolution : []
        content {
          auto_resolved   = alert_resolution.value.auto_resolved
          time_to_resolve = alert_resolution.value.time_to_resolve
        }
      }
    }
  }
}
