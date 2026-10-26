resource "azurerm_stream_analytics_output_function" "stream_analytics_output_functions" {
  for_each = var.stream_analytics_output_functions

  api_key                   = each.value.api_key
  function_app              = each.value.function_app
  function_name             = each.value.function_name
  name                      = each.value.name
  resource_group_name       = each.value.resource_group_name
  stream_analytics_job_name = each.value.stream_analytics_job_name
  batch_max_count           = each.value.batch_max_count
  batch_max_in_bytes        = each.value.batch_max_in_bytes
}
