variable "lb_listener_rules" {
  description = <<EOT
Map of lb_listener_rules, attributes below
Required:
    - listener_arn
    - action
    - condition
Optional:
    - priority
    - region
    - tags
    - tags_all
    - transform
EOT

  type = map(object({
    listener_arn = string
    priority     = optional(number)
    region       = optional(string)
    tags         = optional(map(string))
    tags_all     = optional(map(string))
    action       = list(object({
            type                 = string
            order                = optional(number)
            target_group_arn     = optional(string)
            authenticate_cognito = optional(list(object({
                user_pool_arn                       = string
                user_pool_client_id                 = string
                user_pool_domain                    = string
                authentication_request_extra_params = optional(map(string))
                on_unauthenticated_request          = optional(string)
                scope                               = optional(string)
                session_cookie_name                 = optional(string)
                session_timeout                     = optional(number)
            })))
            authenticate_oidc    = optional(list(object({
                authorization_endpoint              = string
                client_id                           = string
                client_secret                       = string
                issuer                              = string
                token_endpoint                      = string
                user_info_endpoint                  = string
                authentication_request_extra_params = optional(map(string))
                on_unauthenticated_request          = optional(string)
                scope                               = optional(string)
                session_cookie_name                 = optional(string)
                session_timeout                     = optional(number)
            })))
            fixed_response       = optional(list(object({
                content_type = string
                message_body = optional(string)
                status_code  = optional(string)
            })))
            forward              = optional(list(object({
                stickiness   = optional(list(object({
                    duration = number
                    enabled  = optional(bool)
                })))
                target_group = set(object({
                    arn    = string
                    weight = optional(number)
                }))
            })))
            jwt_validation       = optional(list(object({
                issuer           = string
                jwks_endpoint    = string
                additional_claim = optional(set(object({
                    format = string
                    name   = string
                    values = set(string)
                })))
            })))
            redirect             = optional(list(object({
                status_code = string
                host        = optional(string)
                path        = optional(string)
                port        = optional(string)
                protocol    = optional(string)
                query       = optional(string)
            })))
        }))
    condition    = set(object({
            host_header         = optional(list(object({
                regex_values = optional(set(string))
                values       = optional(set(string))
            })))
            http_header         = optional(list(object({
                http_header_name = string
                regex_values     = optional(set(string))
                values           = optional(set(string))
            })))
            http_request_method = optional(list(object({
                values = set(string)
            })))
            path_pattern        = optional(list(object({
                regex_values = optional(set(string))
                values       = optional(set(string))
            })))
            query_string        = optional(set(object({
                value = string
                key   = optional(string)
            })))
            source_ip           = optional(list(object({
                ip_address_type = optional(string)
                values          = optional(set(string))
            })))
        }))
    transform    = optional(set(object({
            type                       = string
            host_header_rewrite_config = optional(list(object({
                rewrite = optional(list(object({
                    regex   = string
                    replace = string
                })))
            })))
            url_rewrite_config         = optional(list(object({
                rewrite = optional(list(object({
                    regex   = string
                    replace = string
                })))
            })))
        })))
  }))
}
