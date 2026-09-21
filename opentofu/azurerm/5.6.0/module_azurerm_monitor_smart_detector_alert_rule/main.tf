resource "azurerm_monitor_smart_detector_alert_rule" "monitor_smart_detector_alert_rules" {
  for_each = var.monitor_smart_detector_alert_rules

  detector_type       = each.value.detector_type
  frequency           = each.value.frequency
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  scope_resource_ids  = each.value.scope_resource_ids
  severity            = each.value.severity
  description         = each.value.description
  enabled             = each.value.enabled
  tags                = each.value.tags
  throttling_duration = each.value.throttling_duration

  dynamic "action_group" {
    for_each = each.value.action_group != null ? each.value.action_group : []
    content {
      ids             = action_group.value.ids
      email_subject   = action_group.value.email_subject
      webhook_payload = action_group.value.webhook_payload
    }
  }
}
