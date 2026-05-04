resource "azurerm_new_relic_tag_rule" "new_relic_tag_rules" {
  for_each = var.new_relic_tag_rules

  monitor_id                         = each.value.monitor_id
  activity_log_enabled               = each.value.activity_log_enabled
  azure_active_directory_log_enabled = each.value.azure_active_directory_log_enabled
  metric_enabled                     = each.value.metric_enabled
  subscription_log_enabled           = each.value.subscription_log_enabled

  dynamic "log_tag_filter" {
    for_each = each.value.log_tag_filter != null ? each.value.log_tag_filter : []
    content {
      action = log_tag_filter.value.action
      name   = log_tag_filter.value.name
      value  = log_tag_filter.value.value
    }
  }

  dynamic "metric_tag_filter" {
    for_each = each.value.metric_tag_filter != null ? each.value.metric_tag_filter : []
    content {
      action = metric_tag_filter.value.action
      name   = metric_tag_filter.value.name
      value  = metric_tag_filter.value.value
    }
  }
}
