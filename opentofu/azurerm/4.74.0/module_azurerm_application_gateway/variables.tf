variable "application_gateways" {
  description = <<EOT
Map of application_gateways, attributes below
Required:
    - location
    - name
    - resource_group_name
    - backend_address_pool
    - frontend_ip_configuration
    - frontend_port
    - gateway_ip_configuration
    - sku
Optional:
    - enable_http2
    - fips_enabled
    - firewall_policy_id
    - force_firewall_policy_association
    - http2_enabled
    - tags
    - zones
    - authentication_certificate
    - autoscale_configuration
    - backend
    - backend_http_settings
    - custom_error_configuration
    - global
    - http_listener
    - identity
    - listener
    - private_link_configuration
    - probe
    - redirect_configuration
    - request_routing_rule
    - rewrite_rule_set
    - routing_rule
    - ssl_certificate
    - ssl_policy
    - ssl_profile
    - trusted_client_certificate
    - trusted_root_certificate
    - url_path_map
    - waf_configuration
EOT

  type = map(object({
    location                          = string
    name                              = string
    resource_group_name               = string
    enable_http2                      = optional(bool)
    fips_enabled                      = optional(bool)
    firewall_policy_id                = optional(string)
    force_firewall_policy_association = optional(bool)
    http2_enabled                     = optional(bool)
    tags                              = optional(map(string))
    zones                             = optional(set(string))
    authentication_certificate        = optional(list(object({
            data = string
            name = string
        })))
    autoscale_configuration           = optional(list(object({
            min_capacity = number
            max_capacity = optional(number)
        })))
    backend                           = optional(list(object({
            name                           = string
            port                           = number
            protocol                       = string
            client_ip_preservation_enabled = optional(bool)
            host_name                      = optional(string)
            probe_name                     = optional(string)
            timeout_in_seconds             = optional(number)
            trusted_root_certificate_names = optional(list(string))
        })))
    backend_address_pool              = set(object({
            name         = string
            fqdns        = optional(set(string))
            ip_addresses = optional(set(string))
        }))
    backend_http_settings             = optional(set(object({
            cookie_based_affinity                = string
            name                                 = string
            port                                 = number
            protocol                             = string
            affinity_cookie_name                 = optional(string)
            dedicated_backend_connection_enabled = optional(bool)
            host_name                            = optional(string)
            path                                 = optional(string)
            pick_host_name_from_backend_address  = optional(bool)
            probe_name                           = optional(string)
            request_timeout                      = optional(number)
            trusted_root_certificate_names       = optional(list(string))
            authentication_certificate           = optional(list(object({
                name = string
            })))
            connection_draining                  = optional(list(object({
                drain_timeout_sec = number
                enabled           = bool
            })))
        })))
    custom_error_configuration        = optional(list(object({
            custom_error_page_url = string
            status_code           = string
        })))
    frontend_ip_configuration         = list(object({
            name                            = string
            private_ip_address              = optional(string)
            private_ip_address_allocation   = optional(string)
            private_link_configuration_name = optional(string)
            public_ip_address_id            = optional(string)
            subnet_id                       = optional(string)
        }))
    frontend_port                     = set(object({
            name = string
            port = number
        }))
    gateway_ip_configuration          = list(object({
            name      = string
            subnet_id = string
        }))
    global                            = optional(list(object({
            request_buffering_enabled  = bool
            response_buffering_enabled = bool
        })))
    http_listener                     = optional(set(object({
            frontend_ip_configuration_name = string
            frontend_port_name             = string
            name                           = string
            protocol                       = string
            firewall_policy_id             = optional(string)
            host_name                      = optional(string)
            host_names                     = optional(set(string))
            require_sni                    = optional(bool)
            ssl_certificate_name           = optional(string)
            ssl_profile_name               = optional(string)
            custom_error_configuration     = optional(list(object({
                custom_error_page_url = string
                status_code           = string
            })))
        })))
    identity                          = optional(list(object({
            type         = string
            identity_ids = optional(set(string))
        })))
    listener                          = optional(set(object({
            frontend_ip_configuration_name = string
            frontend_port_name             = string
            name                           = string
            protocol                       = string
            host_names                     = optional(set(string))
            ssl_certificate_name           = optional(string)
            ssl_profile_name               = optional(string)
        })))
    private_link_configuration        = optional(set(object({
            name             = string
            ip_configuration = list(object({
                name                          = string
                primary                       = bool
                private_ip_address_allocation = string
                subnet_id                     = string
                private_ip_address            = optional(string)
            }))
        })))
    probe                             = optional(set(object({
            interval                                  = number
            name                                      = string
            protocol                                  = string
            timeout                                   = number
            unhealthy_threshold                       = number
            host                                      = optional(string)
            minimum_servers                           = optional(number)
            path                                      = optional(string)
            pick_host_name_from_backend_http_settings = optional(bool)
            port                                      = optional(number)
            proxy_protocol_header_enabled             = optional(bool)
            match                                     = optional(list(object({
                status_code = list(string)
                body        = optional(string)
            })))
        })))
    redirect_configuration            = optional(set(object({
            name                 = string
            redirect_type        = string
            include_path         = optional(bool)
            include_query_string = optional(bool)
            target_listener_name = optional(string)
            target_url           = optional(string)
        })))
    request_routing_rule              = optional(set(object({
            http_listener_name          = string
            name                        = string
            rule_type                   = string
            backend_address_pool_name   = optional(string)
            backend_http_settings_name  = optional(string)
            priority                    = optional(number)
            redirect_configuration_name = optional(string)
            rewrite_rule_set_name       = optional(string)
            url_path_map_name           = optional(string)
        })))
    rewrite_rule_set                  = optional(list(object({
            name         = string
            rewrite_rule = optional(list(object({
                name                          = string
                rule_sequence                 = number
                condition                     = optional(list(object({
                    pattern     = string
                    variable    = string
                    ignore_case = optional(bool)
                    negate      = optional(bool)
                })))
                request_header_configuration  = optional(list(object({
                    header_name  = string
                    header_value = string
                })))
                response_header_configuration = optional(list(object({
                    header_name  = string
                    header_value = string
                })))
                url                           = optional(list(object({
                    components   = optional(string)
                    path         = optional(string)
                    query_string = optional(string)
                    reroute      = optional(bool)
                })))
            })))
        })))
    routing_rule                      = optional(set(object({
            backend_address_pool_name = string
            backend_name              = string
            listener_name             = string
            name                      = string
            priority                  = number
        })))
    sku                               = list(object({
            name     = string
            tier     = string
            capacity = optional(number)
        }))
    ssl_certificate                   = optional(set(object({
            name                = string
            data                = optional(string)
            key_vault_secret_id = optional(string)
            password            = optional(string)
        })))
    ssl_policy                        = optional(list(object({
            cipher_suites        = optional(list(string))
            disabled_protocols   = optional(list(string))
            min_protocol_version = optional(string)
            policy_name          = optional(string)
            policy_type          = optional(string)
        })))
    ssl_profile                       = optional(list(object({
            name                                 = string
            trusted_client_certificate_names     = optional(list(string))
            verify_client_cert_issuer_dn         = optional(bool)
            verify_client_certificate_issuer_dn  = optional(bool)
            verify_client_certificate_revocation = optional(string)
            ssl_policy                           = optional(list(object({
                cipher_suites        = optional(list(string))
                disabled_protocols   = optional(list(string))
                min_protocol_version = optional(string)
                policy_name          = optional(string)
                policy_type          = optional(string)
            })))
        })))
    trusted_client_certificate        = optional(list(object({
            data = string
            name = string
        })))
    trusted_root_certificate          = optional(list(object({
            name                = string
            data                = optional(string)
            key_vault_secret_id = optional(string)
        })))
    url_path_map                      = optional(list(object({
            name                                = string
            default_backend_address_pool_name   = optional(string)
            default_backend_http_settings_name  = optional(string)
            default_redirect_configuration_name = optional(string)
            default_rewrite_rule_set_name       = optional(string)
            path_rule                           = list(object({
                name                        = string
                paths                       = list(string)
                backend_address_pool_name   = optional(string)
                backend_http_settings_name  = optional(string)
                firewall_policy_id          = optional(string)
                redirect_configuration_name = optional(string)
                rewrite_rule_set_name       = optional(string)
            }))
        })))
    waf_configuration                 = optional(list(object({
            enabled                  = bool
            firewall_mode            = string
            rule_set_version         = string
            file_upload_limit_mb     = optional(number)
            max_request_body_size_kb = optional(number)
            request_body_check       = optional(bool)
            rule_set_type            = optional(string)
            disabled_rule_group      = optional(list(object({
                rule_group_name = string
                rules           = optional(list(number))
            })))
            exclusion                = optional(list(object({
                match_variable          = string
                selector                = optional(string)
                selector_match_operator = optional(string)
            })))
        })))
  }))
}
