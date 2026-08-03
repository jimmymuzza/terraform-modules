resource "azurerm_iothub_endpoint_storage_container" "iothub_endpoint_storage_containers" {
  for_each = var.iothub_endpoint_storage_containers

  container_name             = each.value.container_name
  iothub_id                  = each.value.iothub_id
  name                       = each.value.name
  resource_group_name        = each.value.resource_group_name
  authentication_type        = each.value.authentication_type
  batch_frequency_in_seconds = each.value.batch_frequency_in_seconds
  connection_string          = each.value.connection_string
  encoding                   = each.value.encoding
  endpoint_uri               = each.value.endpoint_uri
  file_name_format           = each.value.file_name_format
  identity_id                = each.value.identity_id
  max_chunk_size_in_bytes    = each.value.max_chunk_size_in_bytes
  subscription_id            = each.value.subscription_id
}
