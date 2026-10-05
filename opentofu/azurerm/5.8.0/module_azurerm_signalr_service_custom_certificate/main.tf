resource "azurerm_signalr_service_custom_certificate" "signalr_service_custom_certificates" {
  for_each = var.signalr_service_custom_certificates

  custom_certificate_id = each.value.custom_certificate_id
  name                  = each.value.name
  signalr_service_id    = each.value.signalr_service_id
}
