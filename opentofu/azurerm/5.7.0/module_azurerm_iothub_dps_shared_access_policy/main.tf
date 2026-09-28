resource "azurerm_iothub_dps_shared_access_policy" "iothub_dps_shared_access_policies" {
  for_each = var.iothub_dps_shared_access_policies

  iothub_dps_name     = each.value.iothub_dps_name
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  enrollment_read     = each.value.enrollment_read
  enrollment_write    = each.value.enrollment_write
  registration_read   = each.value.registration_read
  registration_write  = each.value.registration_write
  service_config      = each.value.service_config
}
