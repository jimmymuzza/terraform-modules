resource "azurerm_web_pubsub_custom_certificate" "web_pubsub_custom_certificates" {
  for_each = var.web_pubsub_custom_certificates

  custom_certificate_id = each.value.custom_certificate_id
  name                  = each.value.name
  web_pubsub_id         = each.value.web_pubsub_id
}
