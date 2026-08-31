resource "azurerm_sentinel_alert_rule_ms_security_incident" "sentinel_alert_rule_ms_security_incidents" {
  for_each = var.sentinel_alert_rule_ms_security_incidents

  display_name                = each.value.display_name
  log_analytics_workspace_id  = each.value.log_analytics_workspace_id
  name                        = each.value.name
  product_filter              = each.value.product_filter
  severity_filter             = each.value.severity_filter
  alert_rule_template_guid    = each.value.alert_rule_template_guid
  description                 = each.value.description
  display_name_exclude_filter = each.value.display_name_exclude_filter
  display_name_filter         = each.value.display_name_filter
  enabled                     = each.value.enabled
}
