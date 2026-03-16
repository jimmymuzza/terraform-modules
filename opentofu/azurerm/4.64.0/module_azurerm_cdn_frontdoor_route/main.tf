resource "azurerm_cdn_frontdoor_route" "cdn_frontdoor_routes" {
  for_each = var.cdn_frontdoor_routes

  cdn_frontdoor_endpoint_id       = each.value.cdn_frontdoor_endpoint_id
  cdn_frontdoor_origin_group_id   = each.value.cdn_frontdoor_origin_group_id
  cdn_frontdoor_origin_ids        = each.value.cdn_frontdoor_origin_ids
  name                            = each.value.name
  patterns_to_match               = each.value.patterns_to_match
  supported_protocols             = each.value.supported_protocols
  cdn_frontdoor_custom_domain_ids = each.value.cdn_frontdoor_custom_domain_ids
  cdn_frontdoor_origin_path       = each.value.cdn_frontdoor_origin_path
  cdn_frontdoor_rule_set_ids      = each.value.cdn_frontdoor_rule_set_ids
  enabled                         = each.value.enabled
  forwarding_protocol             = each.value.forwarding_protocol
  https_redirect_enabled          = each.value.https_redirect_enabled
  link_to_default_domain          = each.value.link_to_default_domain

  dynamic "cache" {
    for_each = each.value.cache != null ? each.value.cache : []
    content {
      compression_enabled           = cache.value.compression_enabled
      content_types_to_compress     = cache.value.content_types_to_compress
      query_string_caching_behavior = cache.value.query_string_caching_behavior
      query_strings                 = cache.value.query_strings
    }
  }
}
