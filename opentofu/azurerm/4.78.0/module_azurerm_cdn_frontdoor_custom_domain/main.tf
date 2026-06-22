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
      minimum_version         = tls.value.minimum_version

      dynamic "cipher_suite" {
        for_each = tls.value.cipher_suite != null ? tls.value.cipher_suite : []
        content {
          type = cipher_suite.value.type

          dynamic "custom_ciphers" {
            for_each = cipher_suite.value.custom_ciphers != null ? cipher_suite.value.custom_ciphers : []
            content {
              tls12 = custom_ciphers.value.tls12
              tls13 = custom_ciphers.value.tls13
            }
          }
        }
      }
    }
  }
}
