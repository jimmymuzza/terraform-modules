resource "azurerm_monitor_alert_processing_rule_action_group" "monitor_alert_processing_rule_action_groups" {
  for_each = var.monitor_alert_processing_rule_action_groups

  add_action_group_ids = each.value.add_action_group_ids
  name                 = each.value.name
  resource_group_name  = each.value.resource_group_name
  scopes               = each.value.scopes
  description          = each.value.description
  enabled              = each.value.enabled
  tags                 = each.value.tags

  dynamic "condition" {
    for_each = each.value.condition != null ? each.value.condition : []
    content {

      dynamic "alert_context" {
        for_each = condition.value.alert_context != null ? condition.value.alert_context : []
        content {
          operator = alert_context.value.operator
          values   = alert_context.value.values
        }
      }

      dynamic "alert_rule_id" {
        for_each = condition.value.alert_rule_id != null ? condition.value.alert_rule_id : []
        content {
          operator = alert_rule_id.value.operator
          values   = alert_rule_id.value.values
        }
      }

      dynamic "alert_rule_name" {
        for_each = condition.value.alert_rule_name != null ? condition.value.alert_rule_name : []
        content {
          operator = alert_rule_name.value.operator
          values   = alert_rule_name.value.values
        }
      }

      dynamic "description" {
        for_each = condition.value.description != null ? condition.value.description : []
        content {
          operator = description.value.operator
          values   = description.value.values
        }
      }

      dynamic "monitor_condition" {
        for_each = condition.value.monitor_condition != null ? condition.value.monitor_condition : []
        content {
          operator = monitor_condition.value.operator
          values   = monitor_condition.value.values
        }
      }

      dynamic "monitor_service" {
        for_each = condition.value.monitor_service != null ? condition.value.monitor_service : []
        content {
          operator = monitor_service.value.operator
          values   = monitor_service.value.values
        }
      }

      dynamic "severity" {
        for_each = condition.value.severity != null ? condition.value.severity : []
        content {
          operator = severity.value.operator
          values   = severity.value.values
        }
      }

      dynamic "signal_type" {
        for_each = condition.value.signal_type != null ? condition.value.signal_type : []
        content {
          operator = signal_type.value.operator
          values   = signal_type.value.values
        }
      }

      dynamic "target_resource" {
        for_each = condition.value.target_resource != null ? condition.value.target_resource : []
        content {
          operator = target_resource.value.operator
          values   = target_resource.value.values
        }
      }

      dynamic "target_resource_group" {
        for_each = condition.value.target_resource_group != null ? condition.value.target_resource_group : []
        content {
          operator = target_resource_group.value.operator
          values   = target_resource_group.value.values
        }
      }

      dynamic "target_resource_type" {
        for_each = condition.value.target_resource_type != null ? condition.value.target_resource_type : []
        content {
          operator = target_resource_type.value.operator
          values   = target_resource_type.value.values
        }
      }
    }
  }

  dynamic "schedule" {
    for_each = each.value.schedule != null ? each.value.schedule : []
    content {
      effective_from  = schedule.value.effective_from
      effective_until = schedule.value.effective_until
      time_zone       = schedule.value.time_zone

      dynamic "recurrence" {
        for_each = schedule.value.recurrence != null ? schedule.value.recurrence : []
        content {

          dynamic "daily" {
            for_each = recurrence.value.daily != null ? recurrence.value.daily : []
            content {
              end_time   = daily.value.end_time
              start_time = daily.value.start_time
            }
          }

          dynamic "monthly" {
            for_each = recurrence.value.monthly != null ? recurrence.value.monthly : []
            content {
              days_of_month = monthly.value.days_of_month
              end_time      = monthly.value.end_time
              start_time    = monthly.value.start_time
            }
          }

          dynamic "weekly" {
            for_each = recurrence.value.weekly != null ? recurrence.value.weekly : []
            content {
              days_of_week = weekly.value.days_of_week
              end_time     = weekly.value.end_time
              start_time   = weekly.value.start_time
            }
          }
        }
      }
    }
  }
}
