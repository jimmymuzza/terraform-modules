resource "aws_cloudfront_response_headers_policy" "cloudfront_response_headers_policies" {
  for_each = var.cloudfront_response_headers_policies

  name    = each.value.name
  comment = each.value.comment

  dynamic "cors_config" {
    for_each = each.value.cors_config != null ? each.value.cors_config : []
    content {
      access_control_allow_credentials = cors_config.value.access_control_allow_credentials
      origin_override                  = cors_config.value.origin_override
      access_control_max_age_sec       = cors_config.value.access_control_max_age_sec

      dynamic "access_control_allow_headers" {
        for_each = cors_config.value.access_control_allow_headers != null ? cors_config.value.access_control_allow_headers : []
        content {
          items = access_control_allow_headers.value.items
        }
      }

      dynamic "access_control_allow_methods" {
        for_each = cors_config.value.access_control_allow_methods != null ? cors_config.value.access_control_allow_methods : []
        content {
          items = access_control_allow_methods.value.items
        }
      }

      dynamic "access_control_allow_origins" {
        for_each = cors_config.value.access_control_allow_origins != null ? cors_config.value.access_control_allow_origins : []
        content {
          items = access_control_allow_origins.value.items
        }
      }

      dynamic "access_control_expose_headers" {
        for_each = cors_config.value.access_control_expose_headers != null ? cors_config.value.access_control_expose_headers : []
        content {
          items = access_control_expose_headers.value.items
        }
      }
    }
  }

  dynamic "custom_headers_config" {
    for_each = each.value.custom_headers_config != null ? each.value.custom_headers_config : []
    content {

      dynamic "items" {
        for_each = custom_headers_config.value.items != null ? custom_headers_config.value.items : []
        content {
          header   = items.value.header
          override = items.value.override
          value    = items.value.value
        }
      }
    }
  }

  dynamic "remove_headers_config" {
    for_each = each.value.remove_headers_config != null ? each.value.remove_headers_config : []
    content {

      dynamic "items" {
        for_each = remove_headers_config.value.items != null ? remove_headers_config.value.items : []
        content {
          header = items.value.header
        }
      }
    }
  }

  dynamic "security_headers_config" {
    for_each = each.value.security_headers_config != null ? each.value.security_headers_config : []
    content {

      dynamic "content_security_policy" {
        for_each = security_headers_config.value.content_security_policy != null ? security_headers_config.value.content_security_policy : []
        content {
          content_security_policy = content_security_policy.value.content_security_policy
          override                = content_security_policy.value.override
        }
      }

      dynamic "content_type_options" {
        for_each = security_headers_config.value.content_type_options != null ? security_headers_config.value.content_type_options : []
        content {
          override = content_type_options.value.override
        }
      }

      dynamic "frame_options" {
        for_each = security_headers_config.value.frame_options != null ? security_headers_config.value.frame_options : []
        content {
          frame_option = frame_options.value.frame_option
          override     = frame_options.value.override
        }
      }

      dynamic "referrer_policy" {
        for_each = security_headers_config.value.referrer_policy != null ? security_headers_config.value.referrer_policy : []
        content {
          override        = referrer_policy.value.override
          referrer_policy = referrer_policy.value.referrer_policy
        }
      }

      dynamic "strict_transport_security" {
        for_each = security_headers_config.value.strict_transport_security != null ? security_headers_config.value.strict_transport_security : []
        content {
          access_control_max_age_sec = strict_transport_security.value.access_control_max_age_sec
          override                   = strict_transport_security.value.override
          include_subdomains         = strict_transport_security.value.include_subdomains
          preload                    = strict_transport_security.value.preload
        }
      }

      dynamic "xss_protection" {
        for_each = security_headers_config.value.xss_protection != null ? security_headers_config.value.xss_protection : []
        content {
          override   = xss_protection.value.override
          protection = xss_protection.value.protection
          mode_block = xss_protection.value.mode_block
          report_uri = xss_protection.value.report_uri
        }
      }
    }
  }

  dynamic "server_timing_headers_config" {
    for_each = each.value.server_timing_headers_config != null ? each.value.server_timing_headers_config : []
    content {
      enabled       = server_timing_headers_config.value.enabled
      sampling_rate = server_timing_headers_config.value.sampling_rate
    }
  }
}
