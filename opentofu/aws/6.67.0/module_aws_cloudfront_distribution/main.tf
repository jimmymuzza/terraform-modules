resource "aws_cloudfront_distribution" "cloudfront_distributions" {
  for_each = var.cloudfront_distributions

  enabled                         = each.value.enabled
  aliases                         = each.value.aliases
  anycast_ip_list_id              = each.value.anycast_ip_list_id
  comment                         = each.value.comment
  continuous_deployment_policy_id = each.value.continuous_deployment_policy_id
  default_root_object             = each.value.default_root_object
  http_version                    = each.value.http_version
  is_ipv6_enabled                 = each.value.is_ipv6_enabled
  price_class                     = each.value.price_class
  retain_on_delete                = each.value.retain_on_delete
  staging                         = each.value.staging
  tags                            = each.value.tags
  tags_all                        = each.value.tags_all
  wait_for_deployment             = each.value.wait_for_deployment
  web_acl_id                      = each.value.web_acl_id

  dynamic "cache_tag_config" {
    for_each = each.value.cache_tag_config != null ? each.value.cache_tag_config : []
    content {
      header_name = cache_tag_config.value.header_name
    }
  }

  dynamic "connection_function_association" {
    for_each = each.value.connection_function_association != null ? each.value.connection_function_association : []
    content {
    }
  }

  dynamic "custom_error_response" {
    for_each = each.value.custom_error_response != null ? each.value.custom_error_response : []
    content {
      error_code            = custom_error_response.value.error_code
      error_caching_min_ttl = custom_error_response.value.error_caching_min_ttl
      response_code         = custom_error_response.value.response_code
      response_page_path    = custom_error_response.value.response_page_path
    }
  }

  dynamic "default_cache_behavior" {
    for_each = each.value.default_cache_behavior != null ? each.value.default_cache_behavior : []
    content {
      allowed_methods            = default_cache_behavior.value.allowed_methods
      cached_methods             = default_cache_behavior.value.cached_methods
      target_origin_id           = default_cache_behavior.value.target_origin_id
      viewer_protocol_policy     = default_cache_behavior.value.viewer_protocol_policy
      cache_policy_id            = default_cache_behavior.value.cache_policy_id
      compress                   = default_cache_behavior.value.compress
      default_ttl                = default_cache_behavior.value.default_ttl
      field_level_encryption_id  = default_cache_behavior.value.field_level_encryption_id
      max_ttl                    = default_cache_behavior.value.max_ttl
      min_ttl                    = default_cache_behavior.value.min_ttl
      origin_request_policy_id   = default_cache_behavior.value.origin_request_policy_id
      realtime_log_config_arn    = default_cache_behavior.value.realtime_log_config_arn
      response_headers_policy_id = default_cache_behavior.value.response_headers_policy_id
      smooth_streaming           = default_cache_behavior.value.smooth_streaming
      trusted_key_groups         = default_cache_behavior.value.trusted_key_groups
      trusted_signers            = default_cache_behavior.value.trusted_signers

      dynamic "forwarded_values" {
        for_each = default_cache_behavior.value.forwarded_values != null ? default_cache_behavior.value.forwarded_values : []
        content {
          query_string            = forwarded_values.value.query_string
          headers                 = forwarded_values.value.headers
          query_string_cache_keys = forwarded_values.value.query_string_cache_keys

          dynamic "cookies" {
            for_each = forwarded_values.value.cookies != null ? forwarded_values.value.cookies : []
            content {
              forward           = cookies.value.forward
              whitelisted_names = cookies.value.whitelisted_names
            }
          }
        }
      }

      dynamic "function_association" {
        for_each = default_cache_behavior.value.function_association != null ? default_cache_behavior.value.function_association : []
        content {
          event_type   = function_association.value.event_type
          function_arn = function_association.value.function_arn
        }
      }

      dynamic "grpc_config" {
        for_each = default_cache_behavior.value.grpc_config != null ? default_cache_behavior.value.grpc_config : []
        content {
          enabled = grpc_config.value.enabled
        }
      }

      dynamic "lambda_function_association" {
        for_each = default_cache_behavior.value.lambda_function_association != null ? default_cache_behavior.value.lambda_function_association : []
        content {
          event_type   = lambda_function_association.value.event_type
          lambda_arn   = lambda_function_association.value.lambda_arn
          include_body = lambda_function_association.value.include_body
        }
      }
    }
  }

  dynamic "logging_config" {
    for_each = each.value.logging_config != null ? each.value.logging_config : []
    content {
      bucket          = logging_config.value.bucket
      include_cookies = logging_config.value.include_cookies
      prefix          = logging_config.value.prefix
    }
  }

  dynamic "ordered_cache_behavior" {
    for_each = each.value.ordered_cache_behavior != null ? each.value.ordered_cache_behavior : []
    content {
      allowed_methods            = ordered_cache_behavior.value.allowed_methods
      cached_methods             = ordered_cache_behavior.value.cached_methods
      path_pattern               = ordered_cache_behavior.value.path_pattern
      target_origin_id           = ordered_cache_behavior.value.target_origin_id
      viewer_protocol_policy     = ordered_cache_behavior.value.viewer_protocol_policy
      cache_policy_id            = ordered_cache_behavior.value.cache_policy_id
      compress                   = ordered_cache_behavior.value.compress
      default_ttl                = ordered_cache_behavior.value.default_ttl
      field_level_encryption_id  = ordered_cache_behavior.value.field_level_encryption_id
      max_ttl                    = ordered_cache_behavior.value.max_ttl
      min_ttl                    = ordered_cache_behavior.value.min_ttl
      origin_request_policy_id   = ordered_cache_behavior.value.origin_request_policy_id
      realtime_log_config_arn    = ordered_cache_behavior.value.realtime_log_config_arn
      response_headers_policy_id = ordered_cache_behavior.value.response_headers_policy_id
      smooth_streaming           = ordered_cache_behavior.value.smooth_streaming
      trusted_key_groups         = ordered_cache_behavior.value.trusted_key_groups
      trusted_signers            = ordered_cache_behavior.value.trusted_signers

      dynamic "forwarded_values" {
        for_each = ordered_cache_behavior.value.forwarded_values != null ? ordered_cache_behavior.value.forwarded_values : []
        content {
          query_string            = forwarded_values.value.query_string
          headers                 = forwarded_values.value.headers
          query_string_cache_keys = forwarded_values.value.query_string_cache_keys

          dynamic "cookies" {
            for_each = forwarded_values.value.cookies != null ? forwarded_values.value.cookies : []
            content {
              forward           = cookies.value.forward
              whitelisted_names = cookies.value.whitelisted_names
            }
          }
        }
      }

      dynamic "function_association" {
        for_each = ordered_cache_behavior.value.function_association != null ? ordered_cache_behavior.value.function_association : []
        content {
          event_type   = function_association.value.event_type
          function_arn = function_association.value.function_arn
        }
      }

      dynamic "grpc_config" {
        for_each = ordered_cache_behavior.value.grpc_config != null ? ordered_cache_behavior.value.grpc_config : []
        content {
          enabled = grpc_config.value.enabled
        }
      }

      dynamic "lambda_function_association" {
        for_each = ordered_cache_behavior.value.lambda_function_association != null ? ordered_cache_behavior.value.lambda_function_association : []
        content {
          event_type   = lambda_function_association.value.event_type
          lambda_arn   = lambda_function_association.value.lambda_arn
          include_body = lambda_function_association.value.include_body
        }
      }
    }
  }

  dynamic "origin" {
    for_each = each.value.origin != null ? each.value.origin : []
    content {
      domain_name                 = origin.value.domain_name
      origin_id                   = origin.value.origin_id
      connection_attempts         = origin.value.connection_attempts
      connection_timeout          = origin.value.connection_timeout
      origin_access_control_id    = origin.value.origin_access_control_id
      origin_path                 = origin.value.origin_path
      response_completion_timeout = origin.value.response_completion_timeout

      dynamic "custom_header" {
        for_each = origin.value.custom_header != null ? origin.value.custom_header : []
        content {
          name  = custom_header.value.name
          value = custom_header.value.value
        }
      }

      dynamic "custom_origin_config" {
        for_each = origin.value.custom_origin_config != null ? origin.value.custom_origin_config : []
        content {
          http_port                = custom_origin_config.value.http_port
          https_port               = custom_origin_config.value.https_port
          origin_protocol_policy   = custom_origin_config.value.origin_protocol_policy
          origin_ssl_protocols     = custom_origin_config.value.origin_ssl_protocols
          ip_address_type          = custom_origin_config.value.ip_address_type
          origin_keepalive_timeout = custom_origin_config.value.origin_keepalive_timeout
          origin_read_timeout      = custom_origin_config.value.origin_read_timeout

          dynamic "origin_mtls_config" {
            for_each = custom_origin_config.value.origin_mtls_config != null ? custom_origin_config.value.origin_mtls_config : []
            content {
              client_certificate_arn = origin_mtls_config.value.client_certificate_arn
            }
          }
        }
      }

      dynamic "origin_shield" {
        for_each = origin.value.origin_shield != null ? origin.value.origin_shield : []
        content {
          enabled              = origin_shield.value.enabled
          origin_shield_region = origin_shield.value.origin_shield_region
        }
      }

      dynamic "s3_origin_config" {
        for_each = origin.value.s3_origin_config != null ? origin.value.s3_origin_config : []
        content {
          origin_access_identity = s3_origin_config.value.origin_access_identity
        }
      }

      dynamic "vpc_origin_config" {
        for_each = origin.value.vpc_origin_config != null ? origin.value.vpc_origin_config : []
        content {
          vpc_origin_id            = vpc_origin_config.value.vpc_origin_id
          origin_keepalive_timeout = vpc_origin_config.value.origin_keepalive_timeout
          origin_read_timeout      = vpc_origin_config.value.origin_read_timeout
          owner_account_id         = vpc_origin_config.value.owner_account_id
        }
      }
    }
  }

  dynamic "origin_group" {
    for_each = each.value.origin_group != null ? each.value.origin_group : []
    content {
      origin_id = origin_group.value.origin_id

      dynamic "failover_criteria" {
        for_each = origin_group.value.failover_criteria != null ? origin_group.value.failover_criteria : []
        content {
          status_codes = failover_criteria.value.status_codes
        }
      }

      dynamic "member" {
        for_each = origin_group.value.member != null ? origin_group.value.member : []
        content {
          origin_id = member.value.origin_id
        }
      }
    }
  }

  dynamic "restrictions" {
    for_each = each.value.restrictions != null ? each.value.restrictions : []
    content {

      dynamic "geo_restriction" {
        for_each = restrictions.value.geo_restriction != null ? restrictions.value.geo_restriction : []
        content {
          restriction_type = geo_restriction.value.restriction_type
          locations        = geo_restriction.value.locations
        }
      }
    }
  }

  dynamic "viewer_certificate" {
    for_each = each.value.viewer_certificate != null ? each.value.viewer_certificate : []
    content {
      acm_certificate_arn            = viewer_certificate.value.acm_certificate_arn
      cloudfront_default_certificate = viewer_certificate.value.cloudfront_default_certificate
      iam_certificate_id             = viewer_certificate.value.iam_certificate_id
      minimum_protocol_version       = viewer_certificate.value.minimum_protocol_version
      ssl_support_method             = viewer_certificate.value.ssl_support_method
    }
  }

  dynamic "viewer_mtls_config" {
    for_each = each.value.viewer_mtls_config != null ? each.value.viewer_mtls_config : []
    content {
      mode = viewer_mtls_config.value.mode

      dynamic "trust_store_config" {
        for_each = viewer_mtls_config.value.trust_store_config != null ? viewer_mtls_config.value.trust_store_config : []
        content {
          trust_store_id                 = trust_store_config.value.trust_store_id
          advertise_trust_store_ca_names = trust_store_config.value.advertise_trust_store_ca_names
          ignore_certificate_expiry      = trust_store_config.value.ignore_certificate_expiry
        }
      }
    }
  }
}
