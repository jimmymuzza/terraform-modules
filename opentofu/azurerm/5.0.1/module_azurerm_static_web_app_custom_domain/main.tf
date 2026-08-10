resource "azurerm_static_web_app_custom_domain" "static_web_app_custom_domains" {
  for_each = var.static_web_app_custom_domains

  domain_name       = each.value.domain_name
  static_web_app_id = each.value.static_web_app_id
  validation_type   = each.value.validation_type
}
