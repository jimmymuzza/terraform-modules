resource "azurerm_static_site_custom_domain" "static_site_custom_domains" {
  for_each = var.static_site_custom_domains

  domain_name     = each.value.domain_name
  static_site_id  = each.value.static_site_id
  validation_type = each.value.validation_type
}
