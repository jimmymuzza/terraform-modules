variable "cloudfront_multitenant_distributions" {
  description = <<EOT
Map of cloudfront_multitenant_distributions, attributes below
Required:
    - comment
    - enabled
Optional:
    - default_root_object
    - http_version
    - tags
    - web_acl_id
    - active_trusted_key_groups
    - cache_behavior
    - custom_error_response
    - default_cache_behavior
    - origin
    - origin_group
    - restrictions
    - tenant_config
    - viewer_certificate
EOT

  type = map(object({
    comment                   = string
    enabled                   = bool
    default_root_object       = optional(string)
    http_version              = optional(string)
    tags                      = optional(map(string))
    web_acl_id                = optional(string)
    active_trusted_key_groups = optional(list(object({
            items = optional(list(object({

            })))
        })))
    cache_behavior            = optional(list(object({
            path_pattern                = string
            target_origin_id            = string
            viewer_protocol_policy      = string
            cache_policy_id             = optional(string)
            compress                    = optional(bool)
            field_level_encryption_id   = optional(string)
            origin_request_policy_id    = optional(string)
            realtime_log_config_arn     = optional(string)
            response_headers_policy_id  = optional(string)
            allowed_methods             = optional(list(object({
                cached_methods = set(string)
                items          = set(string)
            })))
            function_association        = optional(set(object({
                event_type   = string
                function_arn = string
            })))
            lambda_function_association = optional(set(object({
                event_type          = string
                lambda_function_arn = string
                include_body        = optional(bool)
            })))
            trusted_key_groups          = optional(list(object({
                enabled = optional(bool)
                items   = optional(list(string))
            })))
        })))
    custom_error_response     = optional(list(object({
            error_code            = number
            error_caching_min_ttl = optional(number)
            response_code         = optional(string)
            response_page_path    = optional(string)
        })))
    default_cache_behavior    = optional(list(object({
            target_origin_id            = string
            viewer_protocol_policy      = string
            cache_policy_id             = optional(string)
            compress                    = optional(bool)
            field_level_encryption_id   = optional(string)
            origin_request_policy_id    = optional(string)
            realtime_log_config_arn     = optional(string)
            response_headers_policy_id  = optional(string)
            allowed_methods             = optional(list(object({
                cached_methods = set(string)
                items          = set(string)
            })))
            function_association        = optional(set(object({
                event_type   = string
                function_arn = string
            })))
            lambda_function_association = optional(set(object({
                event_type          = string
                lambda_function_arn = string
                include_body        = optional(bool)
            })))
            trusted_key_groups          = optional(list(object({
                enabled = optional(bool)
                items   = optional(list(string))
            })))
        })))
    origin                    = optional(set(object({
            domain_name                 = string
            connection_attempts         = optional(number)
            connection_timeout          = optional(number)
            origin_access_control_id    = optional(string)
            origin_path                 = optional(string)
            response_completion_timeout = optional(number)
            custom_header               = optional(list(object({
                header_name  = string
                header_value = string
            })))
            custom_origin_config        = optional(list(object({
                http_port                = number
                https_port               = number
                origin_protocol_policy   = string
                origin_ssl_protocols     = set(string)
                ip_address_type          = optional(string)
                origin_keepalive_timeout = optional(number)
                origin_read_timeout      = optional(number)
            })))
            origin_shield               = optional(list(object({
                enabled              = bool
                origin_shield_region = optional(string)
            })))
            vpc_origin_config           = optional(list(object({
                vpc_origin_id            = string
                origin_keepalive_timeout = optional(number)
                origin_read_timeout      = optional(number)
            })))
        })))
    origin_group              = optional(list(object({
            failover_criteria = optional(list(object({
                status_codes = set(number)
            })))
            member            = optional(list(object({
                origin_id = string
            })))
        })))
    restrictions              = optional(list(object({
            geo_restriction = optional(list(object({
                restriction_type = string
                items            = optional(set(string))
            })))
        })))
    tenant_config             = optional(list(object({
            parameter_definition = optional(list(object({
                name       = string
                definition = optional(list(object({
                    string_schema = optional(list(object({
                        required      = bool
                        comment       = optional(string)
                        default_value = optional(string)
                    })))
                })))
            })))
        })))
    viewer_certificate        = optional(list(object({
            acm_certificate_arn            = optional(string)
            cloudfront_default_certificate = optional(bool)
            minimum_protocol_version       = optional(string)
            ssl_support_method             = optional(string)
        })))
  }))
}
