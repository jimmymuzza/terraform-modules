resource "azurerm_app_service_public_certificate" "app_service_public_certificates" {
  for_each = var.app_service_public_certificates

  app_service_name     = each.value.app_service_name
  blob                 = each.value.blob
  certificate_location = each.value.certificate_location
  certificate_name     = each.value.certificate_name
  resource_group_name  = each.value.resource_group_name
}
