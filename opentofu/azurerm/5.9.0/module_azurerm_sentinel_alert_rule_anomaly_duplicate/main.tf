resource "azurerm_sentinel_alert_rule_anomaly_duplicate" "sentinel_alert_rule_anomaly_duplicates" {
  for_each = var.sentinel_alert_rule_anomaly_duplicates

  built_in_rule_id           = each.value.built_in_rule_id
  display_name               = each.value.display_name
  enabled                    = each.value.enabled
  log_analytics_workspace_id = each.value.log_analytics_workspace_id
  mode                       = each.value.mode

  dynamic "multi_select_observation" {
    for_each = each.value.multi_select_observation != null ? each.value.multi_select_observation : []
    content {
      name   = multi_select_observation.value.name
      values = multi_select_observation.value.values
    }
  }

  dynamic "prioritized_exclude_observation" {
    for_each = each.value.prioritized_exclude_observation != null ? each.value.prioritized_exclude_observation : []
    content {
      name       = prioritized_exclude_observation.value.name
      exclude    = prioritized_exclude_observation.value.exclude
      prioritize = prioritized_exclude_observation.value.prioritize
    }
  }

  dynamic "single_select_observation" {
    for_each = each.value.single_select_observation != null ? each.value.single_select_observation : []
    content {
      name  = single_select_observation.value.name
      value = single_select_observation.value.value
    }
  }

  dynamic "threshold_observation" {
    for_each = each.value.threshold_observation != null ? each.value.threshold_observation : []
    content {
      name  = threshold_observation.value.name
      value = threshold_observation.value.value
    }
  }
}
