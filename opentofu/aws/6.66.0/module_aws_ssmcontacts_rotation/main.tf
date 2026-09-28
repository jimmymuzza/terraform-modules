resource "aws_ssmcontacts_rotation" "ssmcontacts_rotations" {
  for_each = var.ssmcontacts_rotations

  contact_ids  = each.value.contact_ids
  name         = each.value.name
  time_zone_id = each.value.time_zone_id
  region       = each.value.region
  start_time   = each.value.start_time
  tags         = each.value.tags

  dynamic "recurrence" {
    for_each = each.value.recurrence != null ? each.value.recurrence : []
    content {
      number_of_on_calls    = recurrence.value.number_of_on_calls
      recurrence_multiplier = recurrence.value.recurrence_multiplier

      dynamic "daily_settings" {
        for_each = recurrence.value.daily_settings != null ? recurrence.value.daily_settings : []
        content {
          hour_of_day    = daily_settings.value.hour_of_day
          minute_of_hour = daily_settings.value.minute_of_hour
        }
      }

      dynamic "monthly_settings" {
        for_each = recurrence.value.monthly_settings != null ? recurrence.value.monthly_settings : []
        content {
          day_of_month = monthly_settings.value.day_of_month

          dynamic "hand_off_time" {
            for_each = monthly_settings.value.hand_off_time != null ? monthly_settings.value.hand_off_time : []
            content {
              hour_of_day    = hand_off_time.value.hour_of_day
              minute_of_hour = hand_off_time.value.minute_of_hour
            }
          }
        }
      }

      dynamic "shift_coverages" {
        for_each = recurrence.value.shift_coverages != null ? recurrence.value.shift_coverages : []
        content {
          map_block_key = shift_coverages.value.map_block_key

          dynamic "coverage_times" {
            for_each = shift_coverages.value.coverage_times != null ? shift_coverages.value.coverage_times : []
            content {

              dynamic "end" {
                for_each = coverage_times.value.end != null ? coverage_times.value.end : []
                content {
                  hour_of_day    = end.value.hour_of_day
                  minute_of_hour = end.value.minute_of_hour
                }
              }

              dynamic "start" {
                for_each = coverage_times.value.start != null ? coverage_times.value.start : []
                content {
                  hour_of_day    = start.value.hour_of_day
                  minute_of_hour = start.value.minute_of_hour
                }
              }
            }
          }
        }
      }

      dynamic "weekly_settings" {
        for_each = recurrence.value.weekly_settings != null ? recurrence.value.weekly_settings : []
        content {
          day_of_week = weekly_settings.value.day_of_week

          dynamic "hand_off_time" {
            for_each = weekly_settings.value.hand_off_time != null ? weekly_settings.value.hand_off_time : []
            content {
              hour_of_day    = hand_off_time.value.hour_of_day
              minute_of_hour = hand_off_time.value.minute_of_hour
            }
          }
        }
      }
    }
  }
}
