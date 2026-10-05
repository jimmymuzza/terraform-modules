resource "azurerm_logic_app_integration_account_batch_configuration" "logic_app_integration_account_batch_configurations" {
  for_each = var.logic_app_integration_account_batch_configurations

  batch_group_name         = each.value.batch_group_name
  integration_account_name = each.value.integration_account_name
  name                     = each.value.name
  resource_group_name      = each.value.resource_group_name
  metadata                 = each.value.metadata

  dynamic "release_criteria" {
    for_each = each.value.release_criteria != null ? each.value.release_criteria : []
    content {
      batch_size    = release_criteria.value.batch_size
      message_count = release_criteria.value.message_count

      dynamic "recurrence" {
        for_each = release_criteria.value.recurrence != null ? release_criteria.value.recurrence : []
        content {
          frequency  = recurrence.value.frequency
          interval   = recurrence.value.interval
          end_time   = recurrence.value.end_time
          start_time = recurrence.value.start_time
          time_zone  = recurrence.value.time_zone

          dynamic "schedule" {
            for_each = recurrence.value.schedule != null ? recurrence.value.schedule : []
            content {
              hours      = schedule.value.hours
              minutes    = schedule.value.minutes
              month_days = schedule.value.month_days
              week_days  = schedule.value.week_days

              dynamic "monthly" {
                for_each = schedule.value.monthly != null ? schedule.value.monthly : []
                content {
                  week    = monthly.value.week
                  weekday = monthly.value.weekday
                }
              }
            }
          }
        }
      }
    }
  }
}
