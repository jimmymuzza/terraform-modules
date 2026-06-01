resource "azurerm_stream_analytics_output_servicebus_topic" "stream_analytics_output_servicebus_topics" {
  for_each = var.stream_analytics_output_servicebus_topics

  name                      = each.value.name
  resource_group_name       = each.value.resource_group_name
  servicebus_namespace      = each.value.servicebus_namespace
  stream_analytics_job_name = each.value.stream_analytics_job_name
  topic_name                = each.value.topic_name
  authentication_mode       = each.value.authentication_mode
  property_columns          = each.value.property_columns
  shared_access_policy_key  = each.value.shared_access_policy_key
  shared_access_policy_name = each.value.shared_access_policy_name
  system_property_columns   = each.value.system_property_columns

  dynamic "serialization" {
    for_each = each.value.serialization != null ? each.value.serialization : []
    content {
      type            = serialization.value.type
      encoding        = serialization.value.encoding
      field_delimiter = serialization.value.field_delimiter
      format          = serialization.value.format
    }
  }
}
