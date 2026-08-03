resource "azurerm_stream_analytics_function_javascript_uda" "stream_analytics_function_javascript_udas" {
  for_each = var.stream_analytics_function_javascript_udas

  name                    = each.value.name
  script                  = each.value.script
  stream_analytics_job_id = each.value.stream_analytics_job_id

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
