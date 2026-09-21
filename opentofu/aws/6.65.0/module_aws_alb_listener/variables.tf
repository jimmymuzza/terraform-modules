variable "alb_listeners" {
  description = <<EOT
Map of alb_listeners, attributes below
Required:
    - load_balancer_arn
    - default_action
Optional:
    - alpn_policy
    - certificate_arn
    - port
    - protocol
    - region
    - routing_http_request_x_amzn_mtls_clientcert_header_name
    - routing_http_request_x_amzn_mtls_clientcert_issuer_header_name
    - routing_http_request_x_amzn_mtls_clientcert_leaf_header_name
    - routing_http_request_x_amzn_mtls_clientcert_serial_number_header_name
    - routing_http_request_x_amzn_mtls_clientcert_subject_header_name
    - routing_http_request_x_amzn_mtls_clientcert_validity_header_name
    - routing_http_request_x_amzn_tls_cipher_suite_header_name
    - routing_http_request_x_amzn_tls_version_header_name
    - routing_http_response_access_control_allow_credentials_header_value
    - routing_http_response_access_control_allow_headers_header_value
    - routing_http_response_access_control_allow_methods_header_value
    - routing_http_response_access_control_allow_origin_header_value
    - routing_http_response_access_control_expose_headers_header_value
    - routing_http_response_access_control_max_age_header_value
    - routing_http_response_content_security_policy_header_value
    - routing_http_response_server_enabled
    - routing_http_response_strict_transport_security_header_value
    - routing_http_response_x_content_type_options_header_value
    - routing_http_response_x_frame_options_header_value
    - ssl_policy
    - tags
    - tags_all
    - tcp_idle_timeout_seconds
    - mutual_authentication
EOT

  type = map(object({
    load_balancer_arn                                                     = string
    alpn_policy                                                           = optional(string)
    certificate_arn                                                       = optional(string)
    port                                                                  = optional(number)
    protocol                                                              = optional(string)
    region                                                                = optional(string)
    routing_http_request_x_amzn_mtls_clientcert_header_name               = optional(string)
    routing_http_request_x_amzn_mtls_clientcert_issuer_header_name        = optional(string)
    routing_http_request_x_amzn_mtls_clientcert_leaf_header_name          = optional(string)
    routing_http_request_x_amzn_mtls_clientcert_serial_number_header_name = optional(string)
    routing_http_request_x_amzn_mtls_clientcert_subject_header_name       = optional(string)
    routing_http_request_x_amzn_mtls_clientcert_validity_header_name      = optional(string)
    routing_http_request_x_amzn_tls_cipher_suite_header_name              = optional(string)
    routing_http_request_x_amzn_tls_version_header_name                   = optional(string)
    routing_http_response_access_control_allow_credentials_header_value   = optional(string)
    routing_http_response_access_control_allow_headers_header_value       = optional(string)
    routing_http_response_access_control_allow_methods_header_value       = optional(string)
    routing_http_response_access_control_allow_origin_header_value        = optional(string)
    routing_http_response_access_control_expose_headers_header_value      = optional(string)
    routing_http_response_access_control_max_age_header_value             = optional(string)
    routing_http_response_content_security_policy_header_value            = optional(string)
    routing_http_response_server_enabled                                  = optional(bool)
    routing_http_response_strict_transport_security_header_value          = optional(string)
    routing_http_response_x_content_type_options_header_value             = optional(string)
    routing_http_response_x_frame_options_header_value                    = optional(string)
    ssl_policy                                                            = optional(string)
    tags                                                                  = optional(map(string))
    tags_all                                                              = optional(map(string))
    tcp_idle_timeout_seconds                                              = optional(number)
    default_action                                                        = list(object({
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
    mutual_authentication                                                 = optional(list(object({
            mode                             = string
            advertise_trust_store_ca_names   = optional(string)
            ignore_client_certificate_expiry = optional(bool)
            trust_store_arn                  = optional(string)
        })))
  }))
}
