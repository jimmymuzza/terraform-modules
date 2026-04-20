resource "azurerm_logic_app_trigger_recurrence" "logic_app_trigger_recurrences" {
  for_each = var.logic_app_trigger_recurrences

  frequency    = each.value.frequency
  interval     = each.value.interval
  logic_app_id = each.value.logic_app_id
  name         = each.value.name
  start_time   = each.value.start_time
  time_zone    = each.value.time_zone

  dynamic "schedule" {
    for_each = each.value.schedule != null ? each.value.schedule : []
    content {
      at_these_hours   = schedule.value.at_these_hours
      at_these_minutes = schedule.value.at_these_minutes
      on_these_days    = schedule.value.on_these_days
    }
  }
}
