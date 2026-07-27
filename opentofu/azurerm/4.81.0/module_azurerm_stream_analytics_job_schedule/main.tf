resource "azurerm_stream_analytics_job_schedule" "stream_analytics_job_schedules" {
  for_each = var.stream_analytics_job_schedules

  start_mode              = each.value.start_mode
  stream_analytics_job_id = each.value.stream_analytics_job_id
  start_time              = each.value.start_time
}
