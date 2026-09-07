resource "azurerm_web_pubsub_custom_domain" "web_pubsub_custom_domains" {
  for_each = var.web_pubsub_custom_domains

  domain_name                      = each.value.domain_name
  name                             = each.value.name
  web_pubsub_custom_certificate_id = each.value.web_pubsub_custom_certificate_id
  web_pubsub_id                    = each.value.web_pubsub_id
}
