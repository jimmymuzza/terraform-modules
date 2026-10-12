resource "azurerm_datadog_monitor_tag_rule" "datadog_monitor_tag_rules" {
  for_each = var.datadog_monitor_tag_rules

  datadog_monitor_id = each.value.datadog_monitor_id
  name               = each.value.name

  dynamic "log" {
    for_each = each.value.log != null ? each.value.log : []
    content {
      aad_log_enabled          = log.value.aad_log_enabled
      resource_log_enabled     = log.value.resource_log_enabled
      subscription_log_enabled = log.value.subscription_log_enabled

      dynamic "filter" {
        for_each = log.value.filter != null ? log.value.filter : []
        content {
          action = filter.value.action
          name   = filter.value.name
          value  = filter.value.value
        }
      }
    }
  }

  dynamic "metric" {
    for_each = each.value.metric != null ? each.value.metric : []
    content {

      dynamic "filter" {
        for_each = metric.value.filter != null ? metric.value.filter : []
        content {
          action = filter.value.action
          name   = filter.value.name
          value  = filter.value.value
        }
      }
    }
  }
}
