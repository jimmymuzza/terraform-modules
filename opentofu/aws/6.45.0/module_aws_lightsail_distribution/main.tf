resource "aws_lightsail_distribution" "lightsail_distributions" {
  for_each = var.lightsail_distributions

  bundle_id        = each.value.bundle_id
  name             = each.value.name
  certificate_name = each.value.certificate_name
  ip_address_type  = each.value.ip_address_type
  is_enabled       = each.value.is_enabled
  region           = each.value.region
  tags             = each.value.tags
  tags_all         = each.value.tags_all

  dynamic "cache_behavior" {
    for_each = each.value.cache_behavior != null ? each.value.cache_behavior : []
    content {
      behavior = cache_behavior.value.behavior
      path     = cache_behavior.value.path
    }
  }

  dynamic "cache_behavior_settings" {
    for_each = each.value.cache_behavior_settings != null ? each.value.cache_behavior_settings : []
    content {
      allowed_http_methods = cache_behavior_settings.value.allowed_http_methods
      cached_http_methods  = cache_behavior_settings.value.cached_http_methods
      default_ttl          = cache_behavior_settings.value.default_ttl
      maximum_ttl          = cache_behavior_settings.value.maximum_ttl
      minimum_ttl          = cache_behavior_settings.value.minimum_ttl

      dynamic "forwarded_cookies" {
        for_each = cache_behavior_settings.value.forwarded_cookies != null ? cache_behavior_settings.value.forwarded_cookies : []
        content {
          cookies_allow_list = forwarded_cookies.value.cookies_allow_list
          option             = forwarded_cookies.value.option
        }
      }

      dynamic "forwarded_headers" {
        for_each = cache_behavior_settings.value.forwarded_headers != null ? cache_behavior_settings.value.forwarded_headers : []
        content {
          headers_allow_list = forwarded_headers.value.headers_allow_list
          option             = forwarded_headers.value.option
        }
      }

      dynamic "forwarded_query_strings" {
        for_each = cache_behavior_settings.value.forwarded_query_strings != null ? cache_behavior_settings.value.forwarded_query_strings : []
        content {
          option                     = forwarded_query_strings.value.option
          query_strings_allowed_list = forwarded_query_strings.value.query_strings_allowed_list
        }
      }
    }
  }

  dynamic "default_cache_behavior" {
    for_each = each.value.default_cache_behavior != null ? each.value.default_cache_behavior : []
    content {
      behavior = default_cache_behavior.value.behavior
    }
  }

  dynamic "origin" {
    for_each = each.value.origin != null ? each.value.origin : []
    content {
      name            = origin.value.name
      region_name     = origin.value.region_name
      protocol_policy = origin.value.protocol_policy
    }
  }
}
