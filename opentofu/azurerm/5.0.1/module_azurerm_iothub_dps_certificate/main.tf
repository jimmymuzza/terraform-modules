resource "azurerm_iothub_dps_certificate" "iothub_dps_certificates" {
  for_each = var.iothub_dps_certificates

  certificate_content = each.value.certificate_content
  iot_dps_name        = each.value.iot_dps_name
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  is_verified         = each.value.is_verified
}
