resource "azurerm_app_service_managed_certificate" "app_service_managed_certificates" {
  for_each = var.app_service_managed_certificates

  custom_hostname_binding_id = each.value.custom_hostname_binding_id
  tags                       = each.value.tags
}
