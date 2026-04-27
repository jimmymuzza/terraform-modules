resource "azurerm_cdn_frontdoor_custom_domain" "cdn_frontdoor_custom_domains" {
  for_each = var.cdn_frontdoor_custom_domains

  cdn_frontdoor_profile_id = each.value.cdn_frontdoor_profile_id
  host_name                = each.value.host_name
  name                     = each.value.name
  dns_zone_id              = each.value.dns_zone_id

  dynamic "tls" {
    for_each = each.value.tls != null ? each.value.tls : []
    content {
      cdn_frontdoor_secret_id = tls.value.cdn_frontdoor_secret_id
      certificate_type        = tls.value.certificate_type
      minimum_tls_version     = tls.value.minimum_tls_version
    }
  }
}
