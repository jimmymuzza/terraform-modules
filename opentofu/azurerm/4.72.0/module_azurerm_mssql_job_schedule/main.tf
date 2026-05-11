resource "azurerm_mssql_job_schedule" "mssql_job_schedules" {
  for_each = var.mssql_job_schedules

  job_id     = each.value.job_id
  type       = each.value.type
  enabled    = each.value.enabled
  end_time   = each.value.end_time
  interval   = each.value.interval
  start_time = each.value.start_time
}
