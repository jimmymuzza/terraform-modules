resource "azurerm_iothub_shared_access_policy" "iothub_shared_access_policies" {
  for_each = var.iothub_shared_access_policies

  iothub_name         = each.value.iothub_name
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  device_connect      = each.value.device_connect
  registry_read       = each.value.registry_read
  registry_write      = each.value.registry_write
  service_connect     = each.value.service_connect
}
