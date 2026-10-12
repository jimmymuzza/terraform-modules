variable "cdn_frontdoor_rules" {
  description = <<EOT
Map of cdn_frontdoor_rules, attributes below
Required:
    - cdn_frontdoor_rule_set_id
    - name
    - order
    - actions
Optional:
    - behaviour_on_match
    - conditions
EOT

  type = map(object({
    cdn_frontdoor_rule_set_id = string
    name                      = string
    order                     = number
    behaviour_on_match        = optional(string)
    actions                   = list(object({
            modify_request_header        = optional(list(object({
                header_name  = string
                operator     = string
                header_value = optional(string)
            })))
            modify_response_header       = optional(list(object({
                header_name  = string
                operator     = string
                header_value = optional(string)
            })))
            route_configuration_override = optional(list(object({
                caching      = list(object({
                    behaviour               = string
                    compression_enabled     = optional(bool)
                    duration                = optional(string)
                    query_string_behaviour  = optional(string)
                    query_string_parameters = optional(list(string))
                }))
                origin_group = optional(list(object({
                    cdn_frontdoor_origin_group_id = string
                    forwarding_protocol           = string
                })))
            })))
            url_redirect                 = optional(list(object({
                redirect_type         = string
                destination_fragment  = optional(string)
                destination_host_name = optional(string)
                destination_path      = optional(string)
                query_string          = optional(string)
                redirect_protocol     = optional(string)
            })))
            url_rewrite                  = optional(list(object({
                destination_path                = string
                source_pattern                  = string
                preserve_unmatched_path_enabled = optional(bool)
            })))
        }))
    conditions                = optional(list(object({
            client_port            = optional(list(object({
                operator = string
                values   = optional(list(string))
            })))
            device_type            = optional(list(object({
                operator = string
                values   = list(string)
            })))
            host_name              = optional(list(object({
                operator   = string
                transforms = optional(set(string))
                values     = optional(list(string))
            })))
            http_version           = optional(list(object({
                operator = string
                values   = set(string)
            })))
            post_argument          = optional(list(object({
                name       = string
                operator   = string
                transforms = optional(set(string))
                values     = optional(list(string))
            })))
            query_string           = optional(list(object({
                operator   = string
                transforms = optional(set(string))
                values     = optional(list(string))
            })))
            remote_address         = optional(list(object({
                operator = string
                values   = list(string)
            })))
            request_body           = optional(list(object({
                operator   = string
                transforms = optional(set(string))
                values     = optional(list(string))
            })))
            request_cookies        = optional(list(object({
                name       = string
                operator   = string
                transforms = optional(set(string))
                values     = optional(list(string))
            })))
            request_file_extension = optional(list(object({
                operator   = string
                transforms = optional(set(string))
                values     = optional(list(string))
            })))
            request_filename       = optional(list(object({
                operator   = string
                transforms = optional(set(string))
                values     = optional(list(string))
            })))
            request_header         = optional(list(object({
                name       = string
                operator   = string
                transforms = optional(set(string))
                values     = optional(list(string))
            })))
            request_method         = optional(list(object({
                operator = string
                values   = set(string)
            })))
            request_path           = optional(list(object({
                operator   = string
                transforms = optional(set(string))
                values     = optional(list(string))
            })))
            request_scheme         = optional(list(object({
                operator = string
                values   = list(string)
            })))
            request_url            = optional(list(object({
                operator   = string
                transforms = optional(set(string))
                values     = optional(list(string))
            })))
            server_port            = optional(list(object({
                operator = string
                values   = optional(set(string))
            })))
            socket_address         = optional(list(object({
                operator = string
                values   = list(string)
            })))
            ssl_protocol           = optional(list(object({
                operator = string
                values   = set(string)
            })))
        })))
  }))
}
