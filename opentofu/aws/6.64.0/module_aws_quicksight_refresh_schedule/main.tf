resource "aws_quicksight_refresh_schedule" "quicksight_refresh_schedules" {
  for_each = var.quicksight_refresh_schedules

  data_set_id    = each.value.data_set_id
  schedule_id    = each.value.schedule_id
  aws_account_id = each.value.aws_account_id
  region         = each.value.region

  dynamic "schedule" {
    for_each = each.value.schedule != null ? each.value.schedule : []
    content {
      refresh_type          = schedule.value.refresh_type
      start_after_date_time = schedule.value.start_after_date_time

      dynamic "schedule_frequency" {
        for_each = schedule.value.schedule_frequency != null ? schedule.value.schedule_frequency : []
        content {
          interval        = schedule_frequency.value.interval
          time_of_the_day = schedule_frequency.value.time_of_the_day
          timezone        = schedule_frequency.value.timezone

          dynamic "refresh_on_day" {
            for_each = schedule_frequency.value.refresh_on_day != null ? schedule_frequency.value.refresh_on_day : []
            content {
              day_of_month = refresh_on_day.value.day_of_month
              day_of_week  = refresh_on_day.value.day_of_week
            }
          }
        }
      }
    }
  }
}
