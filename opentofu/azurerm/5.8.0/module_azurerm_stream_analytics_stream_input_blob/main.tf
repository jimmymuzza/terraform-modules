resource "azurerm_stream_analytics_stream_input_blob" "stream_analytics_stream_input_blobs" {
  for_each = var.stream_analytics_stream_input_blobs

  date_format               = each.value.date_format
  name                      = each.value.name
  path_pattern              = each.value.path_pattern
  resource_group_name       = each.value.resource_group_name
  storage_account_key       = each.value.storage_account_key
  storage_account_name      = each.value.storage_account_name
  storage_container_name    = each.value.storage_container_name
  stream_analytics_job_name = each.value.stream_analytics_job_name
  time_format               = each.value.time_format
  authentication_mode       = each.value.authentication_mode

  dynamic "serialization" {
    for_each = each.value.serialization != null ? each.value.serialization : []
    content {
      type            = serialization.value.type
      encoding        = serialization.value.encoding
      field_delimiter = serialization.value.field_delimiter
    }
  }
}
