resource "azurerm_mssql_managed_instance_start_stop_schedule" "mssql_managed_instance_start_stop_schedules" {
  for_each = var.mssql_managed_instance_start_stop_schedules

  managed_instance_id = each.value.managed_instance_id
  description         = each.value.description
  timezone_id         = each.value.timezone_id

  dynamic "schedule" {
    for_each = each.value.schedule != null ? each.value.schedule : []
    content {
      start_day  = schedule.value.start_day
      start_time = schedule.value.start_time
      stop_day   = schedule.value.stop_day
      stop_time  = schedule.value.stop_time
    }
  }
}
