resource "azurerm_iothub_file_upload" "iothub_file_uploads" {
  for_each = var.iothub_file_uploads

  connection_string     = each.value.connection_string
  container_name        = each.value.container_name
  iothub_id             = each.value.iothub_id
  authentication_type   = each.value.authentication_type
  default_ttl           = each.value.default_ttl
  identity_id           = each.value.identity_id
  lock_duration         = each.value.lock_duration
  max_delivery_count    = each.value.max_delivery_count
  notifications_enabled = each.value.notifications_enabled
  sas_ttl               = each.value.sas_ttl
}
