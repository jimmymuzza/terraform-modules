resource "azurerm_stream_analytics_stream_input_eventhub" "stream_analytics_stream_input_eventhubs" {
  for_each = var.stream_analytics_stream_input_eventhubs

  eventhub_name                = each.value.eventhub_name
  name                         = each.value.name
  resource_group_name          = each.value.resource_group_name
  servicebus_namespace         = each.value.servicebus_namespace
  stream_analytics_job_name    = each.value.stream_analytics_job_name
  authentication_mode          = each.value.authentication_mode
  eventhub_consumer_group_name = each.value.eventhub_consumer_group_name
  partition_key                = each.value.partition_key
  shared_access_policy_key     = each.value.shared_access_policy_key
  shared_access_policy_name    = each.value.shared_access_policy_name

  dynamic "serialization" {
    for_each = each.value.serialization != null ? each.value.serialization : []
    content {
      type            = serialization.value.type
      encoding        = serialization.value.encoding
      field_delimiter = serialization.value.field_delimiter
    }
  }
}
