variable "cloudfront_distributions" {
  description = <<EOT
Map of cloudfront_distributions, attributes below
Required:
    - enabled
    - default_cache_behavior
    - origin
    - restrictions
    - viewer_certificate
Optional:
    - aliases
    - anycast_ip_list_id
    - comment
    - continuous_deployment_policy_id
    - default_root_object
    - http_version
    - is_ipv6_enabled
    - price_class
    - retain_on_delete
    - staging
    - tags
    - tags_all
    - wait_for_deployment
    - web_acl_id
    - cache_tag_config
    - connection_function_association
    - custom_error_response
    - logging_config
    - ordered_cache_behavior
    - origin_group
    - viewer_mtls_config
EOT

  type = map(object({
    enabled                         = bool
    aliases                         = optional(set(string))
    anycast_ip_list_id              = optional(string)
    comment                         = optional(string)
    continuous_deployment_policy_id = optional(string)
    default_root_object             = optional(string)
    http_version                    = optional(string)
    is_ipv6_enabled                 = optional(bool)
    price_class                     = optional(string)
    retain_on_delete                = optional(bool)
    staging                         = optional(bool)
    tags                            = optional(map(string))
    tags_all                        = optional(map(string))
    wait_for_deployment             = optional(bool)
    web_acl_id                      = optional(string)
    cache_tag_config                = optional(list(object({
            header_name = string
        })))
    connection_function_association = optional(list(object({

        })))
    custom_error_response           = optional(set(object({
            error_code            = number
            error_caching_min_ttl = optional(number)
            response_code         = optional(number)
            response_page_path    = optional(string)
        })))
    default_cache_behavior          = list(object({
            allowed_methods             = set(string)
            cached_methods              = set(string)
            target_origin_id            = string
            viewer_protocol_policy      = string
            cache_policy_id             = optional(string)
            compress                    = optional(bool)
            default_ttl                 = optional(number)
            field_level_encryption_id   = optional(string)
            max_ttl                     = optional(number)
            min_ttl                     = optional(number)
            origin_request_policy_id    = optional(string)
            realtime_log_config_arn     = optional(string)
            response_headers_policy_id  = optional(string)
            smooth_streaming            = optional(bool)
            trusted_key_groups          = optional(list(string))
            trusted_signers             = optional(list(string))
            forwarded_values            = optional(list(object({
                query_string            = bool
                headers                 = optional(set(string))
                query_string_cache_keys = optional(list(string))
                cookies                 = list(object({
                    forward           = string
                    whitelisted_names = optional(set(string))
                }))
            })))
            function_association        = optional(set(object({
                event_type   = string
                function_arn = string
            })))
            grpc_config                 = optional(list(object({
                enabled = optional(bool)
            })))
            lambda_function_association = optional(set(object({
                event_type   = string
                lambda_arn   = string
                include_body = optional(bool)
            })))
        }))
    logging_config                  = optional(list(object({
            bucket          = optional(string)
            include_cookies = optional(bool)
            prefix          = optional(string)
        })))
    ordered_cache_behavior          = optional(list(object({
            allowed_methods             = set(string)
            cached_methods              = set(string)
            path_pattern                = string
            target_origin_id            = string
            viewer_protocol_policy      = string
            cache_policy_id             = optional(string)
            compress                    = optional(bool)
            default_ttl                 = optional(number)
            field_level_encryption_id   = optional(string)
            max_ttl                     = optional(number)
            min_ttl                     = optional(number)
            origin_request_policy_id    = optional(string)
            realtime_log_config_arn     = optional(string)
            response_headers_policy_id  = optional(string)
            smooth_streaming            = optional(bool)
            trusted_key_groups          = optional(list(string))
            trusted_signers             = optional(list(string))
            forwarded_values            = optional(list(object({
                query_string            = bool
                headers                 = optional(set(string))
                query_string_cache_keys = optional(list(string))
                cookies                 = list(object({
                    forward           = string
                    whitelisted_names = optional(set(string))
                }))
            })))
            function_association        = optional(set(object({
                event_type   = string
                function_arn = string
            })))
            grpc_config                 = optional(list(object({
                enabled = optional(bool)
            })))
            lambda_function_association = optional(set(object({
                event_type   = string
                lambda_arn   = string
                include_body = optional(bool)
            })))
        })))
    origin                          = set(object({
            domain_name                 = string
            origin_id                   = string
            connection_attempts         = optional(number)
            connection_timeout          = optional(number)
            origin_access_control_id    = optional(string)
            origin_path                 = optional(string)
            response_completion_timeout = optional(number)
            custom_header               = optional(set(object({
                name  = string
                value = string
            })))
            custom_origin_config        = optional(list(object({
                http_port                = number
                https_port               = number
                origin_protocol_policy   = string
                origin_ssl_protocols     = set(string)
                ip_address_type          = optional(string)
                origin_keepalive_timeout = optional(number)
                origin_read_timeout      = optional(number)
                origin_mtls_config       = optional(list(object({
                    client_certificate_arn = string
                })))
            })))
            origin_shield               = optional(list(object({
                enabled              = bool
                origin_shield_region = optional(string)
            })))
            s3_origin_config            = optional(list(object({
                origin_access_identity = string
            })))
            vpc_origin_config           = optional(list(object({
                vpc_origin_id            = string
                origin_keepalive_timeout = optional(number)
                origin_read_timeout      = optional(number)
                owner_account_id         = optional(string)
            })))
        }))
    origin_group                    = optional(set(object({
            origin_id         = string
            failover_criteria = list(object({
                status_codes = set(number)
            }))
            member            = list(object({
                origin_id = string
            }))
        })))
    restrictions                    = list(object({
            geo_restriction = list(object({
                restriction_type = string
                locations        = optional(set(string))
            }))
        }))
    viewer_certificate              = list(object({
            acm_certificate_arn            = optional(string)
            cloudfront_default_certificate = optional(bool)
            iam_certificate_id             = optional(string)
            minimum_protocol_version       = optional(string)
            ssl_support_method             = optional(string)
        }))
    viewer_mtls_config              = optional(list(object({
            mode               = optional(string)
            trust_store_config = optional(list(object({
                trust_store_id                 = string
                advertise_trust_store_ca_names = optional(bool)
                ignore_certificate_expiry      = optional(bool)
            })))
        })))
  }))
}
