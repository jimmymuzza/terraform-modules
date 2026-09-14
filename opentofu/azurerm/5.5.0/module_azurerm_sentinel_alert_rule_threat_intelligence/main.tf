resource "azurerm_sentinel_alert_rule_threat_intelligence" "sentinel_alert_rule_threat_intelligences" {
  for_each = var.sentinel_alert_rule_threat_intelligences

  alert_rule_template_guid   = each.value.alert_rule_template_guid
  log_analytics_workspace_id = each.value.log_analytics_workspace_id
  name                       = each.value.name
  enabled                    = each.value.enabled
}
