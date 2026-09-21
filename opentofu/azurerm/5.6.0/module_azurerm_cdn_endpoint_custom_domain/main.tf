resource "azurerm_cdn_endpoint_custom_domain" "cdn_endpoint_custom_domains" {
  for_each = var.cdn_endpoint_custom_domains

  cdn_endpoint_id = each.value.cdn_endpoint_id
  host_name       = each.value.host_name
  name            = each.value.name

  dynamic "cdn_managed_https" {
    for_each = each.value.cdn_managed_https != null ? each.value.cdn_managed_https : []
    content {
      certificate_type = cdn_managed_https.value.certificate_type
      protocol_type    = cdn_managed_https.value.protocol_type
      tls_version      = cdn_managed_https.value.tls_version
    }
  }

  dynamic "user_managed_https" {
    for_each = each.value.user_managed_https != null ? each.value.user_managed_https : []
    content {
      key_vault_secret_id = user_managed_https.value.key_vault_secret_id
      tls_version         = user_managed_https.value.tls_version
    }
  }
}
