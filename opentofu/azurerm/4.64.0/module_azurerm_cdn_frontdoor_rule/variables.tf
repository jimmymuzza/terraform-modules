variable "cdn_frontdoor_rules" {
  description = <<EOT
Map of cdn_frontdoor_rules, attributes below
Required:
    - cdn_frontdoor_rule_set_id
    - name
    - order
    - actions
Optional:
    - behavior_on_match
    - conditions
EOT

  type = map(object({
    cdn_frontdoor_rule_set_id = string
    name                      = string
    order                     = number
    behavior_on_match         = optional(string)
    actions                   = list(object({
            request_header_action               = optional(list(object({
                header_action = string
                header_name   = string
                value         = optional(string)
            })))
            response_header_action              = optional(list(object({
                header_action = string
                header_name   = string
                value         = optional(string)
            })))
            route_configuration_override_action = optional(list(object({
                cache_behavior                = optional(string)
                cache_duration                = optional(string)
                cdn_frontdoor_origin_group_id = optional(string)
                compression_enabled           = optional(bool)
                forwarding_protocol           = optional(string)
                query_string_caching_behavior = optional(string)
                query_string_parameters       = optional(list(string))
            })))
            url_redirect_action                 = optional(list(object({
                destination_hostname = string
                redirect_type        = string
                destination_fragment = optional(string)
                destination_path     = optional(string)
                query_string         = optional(string)
                redirect_protocol    = optional(string)
            })))
            url_rewrite_action                  = optional(list(object({
                destination             = string
                source_pattern          = string
                preserve_unmatched_path = optional(bool)
            })))
        }))
    conditions                = optional(list(object({
            client_port_condition        = optional(list(object({
                operator         = string
                match_values     = optional(list(string))
                negate_condition = optional(bool)
            })))
            cookies_condition            = optional(list(object({
                cookie_name      = string
                operator         = string
                match_values     = optional(list(string))
                negate_condition = optional(bool)
                transforms       = optional(set(string))
            })))
            host_name_condition          = optional(list(object({
                operator         = string
                match_values     = optional(list(string))
                negate_condition = optional(bool)
                transforms       = optional(set(string))
            })))
            http_version_condition       = optional(list(object({
                match_values     = set(string)
                negate_condition = optional(bool)
                operator         = optional(string)
            })))
            is_device_condition          = optional(list(object({
                match_values     = optional(list(string))
                negate_condition = optional(bool)
                operator         = optional(string)
            })))
            post_args_condition          = optional(list(object({
                operator         = string
                post_args_name   = string
                match_values     = optional(list(string))
                negate_condition = optional(bool)
                transforms       = optional(set(string))
            })))
            query_string_condition       = optional(list(object({
                operator         = string
                match_values     = optional(list(string))
                negate_condition = optional(bool)
                transforms       = optional(set(string))
            })))
            remote_address_condition     = optional(list(object({
                match_values     = optional(list(string))
                negate_condition = optional(bool)
                operator         = optional(string)
            })))
            request_body_condition       = optional(list(object({
                match_values     = list(string)
                operator         = string
                negate_condition = optional(bool)
                transforms       = optional(set(string))
            })))
            request_header_condition     = optional(list(object({
                header_name      = string
                operator         = string
                match_values     = optional(list(string))
                negate_condition = optional(bool)
                transforms       = optional(set(string))
            })))
            request_method_condition     = optional(list(object({
                match_values     = set(string)
                negate_condition = optional(bool)
                operator         = optional(string)
            })))
            request_scheme_condition     = optional(list(object({
                match_values     = optional(list(string))
                negate_condition = optional(bool)
                operator         = optional(string)
            })))
            request_uri_condition        = optional(list(object({
                operator         = string
                match_values     = optional(list(string))
                negate_condition = optional(bool)
                transforms       = optional(set(string))
            })))
            server_port_condition        = optional(list(object({
                match_values     = set(string)
                operator         = string
                negate_condition = optional(bool)
            })))
            socket_address_condition     = optional(list(object({
                match_values     = optional(list(string))
                negate_condition = optional(bool)
                operator         = optional(string)
            })))
            ssl_protocol_condition       = optional(list(object({
                match_values     = set(string)
                negate_condition = optional(bool)
                operator         = optional(string)
            })))
            url_file_extension_condition = optional(list(object({
                match_values     = list(string)
                operator         = string
                negate_condition = optional(bool)
                transforms       = optional(set(string))
            })))
            url_filename_condition       = optional(list(object({
                operator         = string
                match_values     = optional(list(string))
                negate_condition = optional(bool)
                transforms       = optional(set(string))
            })))
            url_path_condition           = optional(list(object({
                operator         = string
                match_values     = optional(list(string))
                negate_condition = optional(bool)
                transforms       = optional(set(string))
            })))
        })))
  }))
}
