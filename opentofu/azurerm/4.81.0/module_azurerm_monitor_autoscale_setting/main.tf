resource "azurerm_monitor_autoscale_setting" "monitor_autoscale_settings" {
  for_each = var.monitor_autoscale_settings

  location            = each.value.location
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  target_resource_id  = each.value.target_resource_id
  enabled             = each.value.enabled
  tags                = each.value.tags

  dynamic "notification" {
    for_each = each.value.notification != null ? each.value.notification : []
    content {

      dynamic "email" {
        for_each = notification.value.email != null ? notification.value.email : []
        content {
          custom_emails                         = email.value.custom_emails
          send_to_subscription_administrator    = email.value.send_to_subscription_administrator
          send_to_subscription_co_administrator = email.value.send_to_subscription_co_administrator
        }
      }

      dynamic "webhook" {
        for_each = notification.value.webhook != null ? notification.value.webhook : []
        content {
          service_uri = webhook.value.service_uri
          properties  = webhook.value.properties
        }
      }
    }
  }

  dynamic "predictive" {
    for_each = each.value.predictive != null ? each.value.predictive : []
    content {
      scale_mode      = predictive.value.scale_mode
      look_ahead_time = predictive.value.look_ahead_time
    }
  }

  dynamic "profile" {
    for_each = each.value.profile != null ? each.value.profile : []
    content {
      name = profile.value.name

      dynamic "capacity" {
        for_each = profile.value.capacity != null ? profile.value.capacity : []
        content {
          default = capacity.value.default
          maximum = capacity.value.maximum
          minimum = capacity.value.minimum
        }
      }

      dynamic "fixed_date" {
        for_each = profile.value.fixed_date != null ? profile.value.fixed_date : []
        content {
          end      = fixed_date.value.end
          start    = fixed_date.value.start
          timezone = fixed_date.value.timezone
        }
      }

      dynamic "recurrence" {
        for_each = profile.value.recurrence != null ? profile.value.recurrence : []
        content {
          days     = recurrence.value.days
          hours    = recurrence.value.hours
          minutes  = recurrence.value.minutes
          timezone = recurrence.value.timezone
        }
      }

      dynamic "rule" {
        for_each = profile.value.rule != null ? profile.value.rule : []
        content {

          dynamic "metric_trigger" {
            for_each = rule.value.metric_trigger != null ? rule.value.metric_trigger : []
            content {
              metric_name              = metric_trigger.value.metric_name
              metric_resource_id       = metric_trigger.value.metric_resource_id
              operator                 = metric_trigger.value.operator
              statistic                = metric_trigger.value.statistic
              threshold                = metric_trigger.value.threshold
              time_aggregation         = metric_trigger.value.time_aggregation
              time_grain               = metric_trigger.value.time_grain
              time_window              = metric_trigger.value.time_window
              divide_by_instance_count = metric_trigger.value.divide_by_instance_count
              metric_namespace         = metric_trigger.value.metric_namespace

              dynamic "dimensions" {
                for_each = metric_trigger.value.dimensions != null ? metric_trigger.value.dimensions : []
                content {
                  name     = dimensions.value.name
                  operator = dimensions.value.operator
                  values   = dimensions.value.values
                }
              }
            }
          }

          dynamic "scale_action" {
            for_each = rule.value.scale_action != null ? rule.value.scale_action : []
            content {
              cooldown  = scale_action.value.cooldown
              direction = scale_action.value.direction
              type      = scale_action.value.type
              value     = scale_action.value.value
            }
          }
        }
      }
    }
  }
}
