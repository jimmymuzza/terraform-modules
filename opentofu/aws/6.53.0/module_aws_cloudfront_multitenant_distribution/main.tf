resource "aws_cloudfront_multitenant_distribution" "cloudfront_multitenant_distributions" {
  for_each = var.cloudfront_multitenant_distributions

  comment             = each.value.comment
  enabled             = each.value.enabled
  default_root_object = each.value.default_root_object
  http_version        = each.value.http_version
  tags                = each.value.tags
  web_acl_id          = each.value.web_acl_id

  dynamic "active_trusted_key_groups" {
    for_each = each.value.active_trusted_key_groups != null ? each.value.active_trusted_key_groups : []
    content {

      dynamic "items" {
        for_each = active_trusted_key_groups.value.items != null ? active_trusted_key_groups.value.items : []
        content {
        }
      }
    }
  }

  dynamic "cache_behavior" {
    for_each = each.value.cache_behavior != null ? each.value.cache_behavior : []
    content {
      path_pattern               = cache_behavior.value.path_pattern
      target_origin_id           = cache_behavior.value.target_origin_id
      viewer_protocol_policy     = cache_behavior.value.viewer_protocol_policy
      cache_policy_id            = cache_behavior.value.cache_policy_id
      compress                   = cache_behavior.value.compress
      field_level_encryption_id  = cache_behavior.value.field_level_encryption_id
      origin_request_policy_id   = cache_behavior.value.origin_request_policy_id
      realtime_log_config_arn    = cache_behavior.value.realtime_log_config_arn
      response_headers_policy_id = cache_behavior.value.response_headers_policy_id

      dynamic "allowed_methods" {
        for_each = cache_behavior.value.allowed_methods != null ? cache_behavior.value.allowed_methods : []
        content {
          cached_methods = allowed_methods.value.cached_methods
          items          = allowed_methods.value.items
        }
      }

      dynamic "function_association" {
        for_each = cache_behavior.value.function_association != null ? cache_behavior.value.function_association : []
        content {
          event_type   = function_association.value.event_type
          function_arn = function_association.value.function_arn
        }
      }

      dynamic "lambda_function_association" {
        for_each = cache_behavior.value.lambda_function_association != null ? cache_behavior.value.lambda_function_association : []
        content {
          event_type          = lambda_function_association.value.event_type
          lambda_function_arn = lambda_function_association.value.lambda_function_arn
          include_body        = lambda_function_association.value.include_body
        }
      }

      dynamic "trusted_key_groups" {
        for_each = cache_behavior.value.trusted_key_groups != null ? cache_behavior.value.trusted_key_groups : []
        content {
          enabled = trusted_key_groups.value.enabled
          items   = trusted_key_groups.value.items
        }
      }
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
      target_origin_id           = default_cache_behavior.value.target_origin_id
      viewer_protocol_policy     = default_cache_behavior.value.viewer_protocol_policy
      cache_policy_id            = default_cache_behavior.value.cache_policy_id
      compress                   = default_cache_behavior.value.compress
      field_level_encryption_id  = default_cache_behavior.value.field_level_encryption_id
      origin_request_policy_id   = default_cache_behavior.value.origin_request_policy_id
      realtime_log_config_arn    = default_cache_behavior.value.realtime_log_config_arn
      response_headers_policy_id = default_cache_behavior.value.response_headers_policy_id

      dynamic "allowed_methods" {
        for_each = default_cache_behavior.value.allowed_methods != null ? default_cache_behavior.value.allowed_methods : []
        content {
          cached_methods = allowed_methods.value.cached_methods
          items          = allowed_methods.value.items
        }
      }

      dynamic "function_association" {
        for_each = default_cache_behavior.value.function_association != null ? default_cache_behavior.value.function_association : []
        content {
          event_type   = function_association.value.event_type
          function_arn = function_association.value.function_arn
        }
      }

      dynamic "lambda_function_association" {
        for_each = default_cache_behavior.value.lambda_function_association != null ? default_cache_behavior.value.lambda_function_association : []
        content {
          event_type          = lambda_function_association.value.event_type
          lambda_function_arn = lambda_function_association.value.lambda_function_arn
          include_body        = lambda_function_association.value.include_body
        }
      }

      dynamic "trusted_key_groups" {
        for_each = default_cache_behavior.value.trusted_key_groups != null ? default_cache_behavior.value.trusted_key_groups : []
        content {
          enabled = trusted_key_groups.value.enabled
          items   = trusted_key_groups.value.items
        }
      }
    }
  }

  dynamic "origin" {
    for_each = each.value.origin != null ? each.value.origin : []
    content {
      domain_name                 = origin.value.domain_name
      connection_attempts         = origin.value.connection_attempts
      connection_timeout          = origin.value.connection_timeout
      origin_access_control_id    = origin.value.origin_access_control_id
      origin_path                 = origin.value.origin_path
      response_completion_timeout = origin.value.response_completion_timeout

      dynamic "custom_header" {
        for_each = origin.value.custom_header != null ? origin.value.custom_header : []
        content {
          header_name  = custom_header.value.header_name
          header_value = custom_header.value.header_value
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

      dynamic "vpc_origin_config" {
        for_each = origin.value.vpc_origin_config != null ? origin.value.vpc_origin_config : []
        content {
          vpc_origin_id            = vpc_origin_config.value.vpc_origin_id
          origin_keepalive_timeout = vpc_origin_config.value.origin_keepalive_timeout
          origin_read_timeout      = vpc_origin_config.value.origin_read_timeout
        }
      }
    }
  }

  dynamic "origin_group" {
    for_each = each.value.origin_group != null ? each.value.origin_group : []
    content {

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
          items            = geo_restriction.value.items
        }
      }
    }
  }

  dynamic "tenant_config" {
    for_each = each.value.tenant_config != null ? each.value.tenant_config : []
    content {

      dynamic "parameter_definition" {
        for_each = tenant_config.value.parameter_definition != null ? tenant_config.value.parameter_definition : []
        content {
          name = parameter_definition.value.name

          dynamic "definition" {
            for_each = parameter_definition.value.definition != null ? parameter_definition.value.definition : []
            content {

              dynamic "string_schema" {
                for_each = definition.value.string_schema != null ? definition.value.string_schema : []
                content {
                  required      = string_schema.value.required
                  comment       = string_schema.value.comment
                  default_value = string_schema.value.default_value
                }
              }
            }
          }
        }
      }
    }
  }

  dynamic "viewer_certificate" {
    for_each = each.value.viewer_certificate != null ? each.value.viewer_certificate : []
    content {
      acm_certificate_arn            = viewer_certificate.value.acm_certificate_arn
      cloudfront_default_certificate = viewer_certificate.value.cloudfront_default_certificate
      minimum_protocol_version       = viewer_certificate.value.minimum_protocol_version
      ssl_support_method             = viewer_certificate.value.ssl_support_method
    }
  }
}
