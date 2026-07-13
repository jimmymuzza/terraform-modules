variable "cdn_endpoints" {
  description = <<EOT
Map of cdn_endpoints, attributes below
Required:
    - location
    - name
    - profile_name
    - resource_group_name
    - origin
Optional:
    - content_types_to_compress
    - is_compression_enabled
    - is_http_allowed
    - is_https_allowed
    - optimization_type
    - origin_host_header
    - origin_path
    - probe_path
    - querystring_caching_behaviour
    - tags
    - delivery_rule
    - geo_filter
    - global_delivery_rule
EOT

  type = map(object({
    location                      = string
    name                          = string
    profile_name                  = string
    resource_group_name           = string
    content_types_to_compress     = optional(set(string))
    is_compression_enabled        = optional(bool)
    is_http_allowed               = optional(bool)
    is_https_allowed              = optional(bool)
    optimization_type             = optional(string)
    origin_host_header            = optional(string)
    origin_path                   = optional(string)
    probe_path                    = optional(string)
    querystring_caching_behaviour = optional(string)
    tags                          = optional(map(string))
    delivery_rule                 = optional(list(object({
            name                          = string
            order                         = number
            cache_expiration_action       = optional(list(object({
                behavior = string
                duration = optional(string)
            })))
            cache_key_query_string_action = optional(list(object({
                behavior   = string
                parameters = optional(string)
            })))
            cookies_condition             = optional(list(object({
                operator         = string
                selector         = string
                match_values     = optional(set(string))
                negate_condition = optional(bool)
                transforms       = optional(list(string))
            })))
            device_condition              = optional(list(object({
                match_values     = set(string)
                negate_condition = optional(bool)
                operator         = optional(string)
            })))
            http_version_condition        = optional(list(object({
                match_values     = set(string)
                negate_condition = optional(bool)
                operator         = optional(string)
            })))
            modify_request_header_action  = optional(list(object({
                action = string
                name   = string
                value  = optional(string)
            })))
            modify_response_header_action = optional(list(object({
                action = string
                name   = string
                value  = optional(string)
            })))
            post_arg_condition            = optional(list(object({
                operator         = string
                selector         = string
                match_values     = optional(set(string))
                negate_condition = optional(bool)
                transforms       = optional(list(string))
            })))
            query_string_condition        = optional(list(object({
                operator         = string
                match_values     = optional(set(string))
                negate_condition = optional(bool)
                transforms       = optional(list(string))
            })))
            remote_address_condition      = optional(list(object({
                operator         = string
                match_values     = optional(set(string))
                negate_condition = optional(bool)
            })))
            request_body_condition        = optional(list(object({
                operator         = string
                match_values     = optional(set(string))
                negate_condition = optional(bool)
                transforms       = optional(list(string))
            })))
            request_header_condition      = optional(list(object({
                operator         = string
                selector         = string
                match_values     = optional(set(string))
                negate_condition = optional(bool)
                transforms       = optional(list(string))
            })))
            request_method_condition      = optional(list(object({
                match_values     = set(string)
                negate_condition = optional(bool)
                operator         = optional(string)
            })))
            request_scheme_condition      = optional(list(object({
                match_values     = set(string)
                negate_condition = optional(bool)
                operator         = optional(string)
            })))
            request_uri_condition         = optional(list(object({
                operator         = string
                match_values     = optional(set(string))
                negate_condition = optional(bool)
                transforms       = optional(list(string))
            })))
            url_file_extension_condition  = optional(list(object({
                operator         = string
                match_values     = optional(set(string))
                negate_condition = optional(bool)
                transforms       = optional(list(string))
            })))
            url_file_name_condition       = optional(list(object({
                operator         = string
                match_values     = optional(set(string))
                negate_condition = optional(bool)
                transforms       = optional(list(string))
            })))
            url_path_condition            = optional(list(object({
                operator         = string
                match_values     = optional(set(string))
                negate_condition = optional(bool)
                transforms       = optional(list(string))
            })))
            url_redirect_action           = optional(list(object({
                redirect_type = string
                fragment      = optional(string)
                hostname      = optional(string)
                path          = optional(string)
                protocol      = optional(string)
                query_string  = optional(string)
            })))
            url_rewrite_action            = optional(list(object({
                destination             = string
                source_pattern          = string
                preserve_unmatched_path = optional(bool)
            })))
        })))
    geo_filter                    = optional(list(object({
            action        = string
            country_codes = list(string)
            relative_path = string
        })))
    global_delivery_rule          = optional(list(object({
            cache_expiration_action       = optional(list(object({
                behavior = string
                duration = optional(string)
            })))
            cache_key_query_string_action = optional(list(object({
                behavior   = string
                parameters = optional(string)
            })))
            modify_request_header_action  = optional(list(object({
                action = string
                name   = string
                value  = optional(string)
            })))
            modify_response_header_action = optional(list(object({
                action = string
                name   = string
                value  = optional(string)
            })))
            url_redirect_action           = optional(list(object({
                redirect_type = string
                fragment      = optional(string)
                hostname      = optional(string)
                path          = optional(string)
                protocol      = optional(string)
                query_string  = optional(string)
            })))
            url_rewrite_action            = optional(list(object({
                destination             = string
                source_pattern          = string
                preserve_unmatched_path = optional(bool)
            })))
        })))
    origin                        = set(object({
            host_name  = string
            name       = string
            http_port  = optional(number)
            https_port = optional(number)
        }))
  }))
}
