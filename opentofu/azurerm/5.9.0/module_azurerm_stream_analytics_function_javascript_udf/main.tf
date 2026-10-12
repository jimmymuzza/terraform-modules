resource "azurerm_stream_analytics_function_javascript_udf" "stream_analytics_function_javascript_udfs" {
  for_each = var.stream_analytics_function_javascript_udfs

  name                      = each.value.name
  resource_group_name       = each.value.resource_group_name
  script                    = each.value.script
  stream_analytics_job_name = each.value.stream_analytics_job_name

  dynamic "input" {
    for_each = each.value.input != null ? each.value.input : []
    content {
      type                    = input.value.type
      configuration_parameter = input.value.configuration_parameter
    }
  }

  dynamic "output" {
    for_each = each.value.output != null ? each.value.output : []
    content {
      type = output.value.type
    }
  }
}
