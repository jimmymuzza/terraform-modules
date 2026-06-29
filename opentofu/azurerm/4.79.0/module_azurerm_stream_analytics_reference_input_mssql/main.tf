resource "azurerm_stream_analytics_reference_input_mssql" "stream_analytics_reference_input_mssqls" {
  for_each = var.stream_analytics_reference_input_mssqls

  database                  = each.value.database
  full_snapshot_query       = each.value.full_snapshot_query
  name                      = each.value.name
  password                  = each.value.password
  refresh_type              = each.value.refresh_type
  resource_group_name       = each.value.resource_group_name
  server                    = each.value.server
  stream_analytics_job_name = each.value.stream_analytics_job_name
  username                  = each.value.username
  delta_snapshot_query      = each.value.delta_snapshot_query
  refresh_interval_duration = each.value.refresh_interval_duration
  table                     = each.value.table
}
