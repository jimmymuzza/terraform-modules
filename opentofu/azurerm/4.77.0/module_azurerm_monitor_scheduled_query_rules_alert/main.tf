resource "azurerm_monitor_scheduled_query_rules_alert" "monitor_scheduled_query_rules_alerts" {
  for_each = var.monitor_scheduled_query_rules_alerts

  data_source_id          = each.value.data_source_id
  frequency               = each.value.frequency
  location                = each.value.location
  name                    = each.value.name
  query                   = each.value.query
  resource_group_name     = each.value.resource_group_name
  time_window             = each.value.time_window
  authorized_resource_ids = each.value.authorized_resource_ids
  auto_mitigation_enabled = each.value.auto_mitigation_enabled
  description             = each.value.description
  enabled                 = each.value.enabled
  query_type              = each.value.query_type
  severity                = each.value.severity
  tags                    = each.value.tags
  throttling              = each.value.throttling

  dynamic "action" {
    for_each = each.value.action != null ? each.value.action : []
    content {
      action_group           = action.value.action_group
      custom_webhook_payload = action.value.custom_webhook_payload
      email_subject          = action.value.email_subject
    }
  }

  dynamic "trigger" {
    for_each = each.value.trigger != null ? each.value.trigger : []
    content {
      operator  = trigger.value.operator
      threshold = trigger.value.threshold

      dynamic "metric_trigger" {
        for_each = trigger.value.metric_trigger != null ? trigger.value.metric_trigger : []
        content {
          metric_trigger_type = metric_trigger.value.metric_trigger_type
          operator            = metric_trigger.value.operator
          threshold           = metric_trigger.value.threshold
          metric_column       = metric_trigger.value.metric_column
        }
      }
    }
  }
}
