resource "azurerm_stream_analytics_stream_input_iothub" "stream_analytics_stream_input_iothubs" {
  for_each = var.stream_analytics_stream_input_iothubs

  endpoint                     = each.value.endpoint
  eventhub_consumer_group_name = each.value.eventhub_consumer_group_name
  iothub_namespace             = each.value.iothub_namespace
  name                         = each.value.name
  resource_group_name          = each.value.resource_group_name
  shared_access_policy_key     = each.value.shared_access_policy_key
  shared_access_policy_name    = each.value.shared_access_policy_name
  stream_analytics_job_name    = each.value.stream_analytics_job_name

  dynamic "serialization" {
    for_each = each.value.serialization != null ? each.value.serialization : []
    content {
      type            = serialization.value.type
      encoding        = serialization.value.encoding
      field_delimiter = serialization.value.field_delimiter
    }
  }
}
