resource "azurerm_signalr_service_custom_domain" "signalr_service_custom_domains" {
  for_each = var.signalr_service_custom_domains

  domain_name                   = each.value.domain_name
  name                          = each.value.name
  signalr_custom_certificate_id = each.value.signalr_custom_certificate_id
  signalr_service_id            = each.value.signalr_service_id
}
