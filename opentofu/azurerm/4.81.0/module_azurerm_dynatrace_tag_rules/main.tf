resource "azurerm_dynatrace_tag_rules" "dynatrace_tag_rules" {
  for_each = var.dynatrace_tag_rules

  monitor_id = each.value.monitor_id
  name       = each.value.name

  dynamic "log_rule" {
    for_each = each.value.log_rule != null ? each.value.log_rule : []
    content {
      send_activity_logs_enabled               = log_rule.value.send_activity_logs_enabled
      send_azure_active_directory_logs_enabled = log_rule.value.send_azure_active_directory_logs_enabled
      send_subscription_logs_enabled           = log_rule.value.send_subscription_logs_enabled

      dynamic "filtering_tag" {
        for_each = log_rule.value.filtering_tag != null ? log_rule.value.filtering_tag : []
        content {
          action = filtering_tag.value.action
          name   = filtering_tag.value.name
          value  = filtering_tag.value.value
        }
      }
    }
  }

  dynamic "metric_rule" {
    for_each = each.value.metric_rule != null ? each.value.metric_rule : []
    content {
      sending_metrics_enabled = metric_rule.value.sending_metrics_enabled

      dynamic "filtering_tag" {
        for_each = metric_rule.value.filtering_tag != null ? metric_rule.value.filtering_tag : []
        content {
          action = filtering_tag.value.action
          name   = filtering_tag.value.name
          value  = filtering_tag.value.value
        }
      }
    }
  }
}
