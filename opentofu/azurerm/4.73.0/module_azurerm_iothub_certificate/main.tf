resource "azurerm_iothub_certificate" "iothub_certificates" {
  for_each = var.iothub_certificates

  certificate_content = each.value.certificate_content
  iothub_name         = each.value.iothub_name
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  is_verified         = each.value.is_verified
}
