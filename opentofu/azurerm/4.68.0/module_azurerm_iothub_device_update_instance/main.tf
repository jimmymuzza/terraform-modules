resource "azurerm_iothub_device_update_instance" "iothub_device_update_instances" {
  for_each = var.iothub_device_update_instances

  device_update_account_id = each.value.device_update_account_id
  iothub_id                = each.value.iothub_id
  name                     = each.value.name
  diagnostic_enabled       = each.value.diagnostic_enabled
  tags                     = each.value.tags

  dynamic "diagnostic_storage_account" {
    for_each = each.value.diagnostic_storage_account != null ? each.value.diagnostic_storage_account : []
    content {
      connection_string = diagnostic_storage_account.value.connection_string
    }
  }
}
