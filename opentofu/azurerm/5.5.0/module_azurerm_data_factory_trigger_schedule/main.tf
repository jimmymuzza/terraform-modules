resource "azurerm_data_factory_trigger_schedule" "data_factory_trigger_schedules" {
  for_each = var.data_factory_trigger_schedules

  data_factory_id     = each.value.data_factory_id
  name                = each.value.name
  activated           = each.value.activated
  annotations         = each.value.annotations
  description         = each.value.description
  end_time            = each.value.end_time
  frequency           = each.value.frequency
  interval            = each.value.interval
  pipeline_name       = each.value.pipeline_name
  pipeline_parameters = each.value.pipeline_parameters
  start_time          = each.value.start_time
  time_zone           = each.value.time_zone

  dynamic "pipeline" {
    for_each = each.value.pipeline != null ? each.value.pipeline : []
    content {
      name       = pipeline.value.name
      parameters = pipeline.value.parameters
    }
  }

  dynamic "schedule" {
    for_each = each.value.schedule != null ? each.value.schedule : []
    content {
      days_of_month = schedule.value.days_of_month
      days_of_week  = schedule.value.days_of_week
      hours         = schedule.value.hours
      minutes       = schedule.value.minutes

      dynamic "monthly" {
        for_each = schedule.value.monthly != null ? schedule.value.monthly : []
        content {
          weekday = monthly.value.weekday
          week    = monthly.value.week
        }
      }
    }
  }
}
