resource "azurerm_stream_analytics_output_mssql" "stream_analytics_output_mssqls" {
  for_each = var.stream_analytics_output_mssqls

  database                  = each.value.database
  name                      = each.value.name
  resource_group_name       = each.value.resource_group_name
  server                    = each.value.server
  stream_analytics_job_name = each.value.stream_analytics_job_name
  table                     = each.value.table
  authentication_mode       = each.value.authentication_mode
  max_batch_count           = each.value.max_batch_count
  max_writer_count          = each.value.max_writer_count
  password                  = each.value.password
  user                      = each.value.user
}
