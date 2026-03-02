variable "function_apps" {
  description = <<EOT
Map of function_apps, attributes below
Required:
    - app_service_plan_id
    - location
    - name
    - resource_group_name
    - storage_account_access_key
    - storage_account_name
Optional:
    - app_settings
    - client_cert_mode
    - daily_memory_time_quota
    - enable_builtin_logging
    - enabled
    - https_only
    - key_vault_reference_identity_id
    - os_type
    - tags
    - version
    - auth_settings
    - connection_string
    - identity
    - site_config
    - source_control
EOT

  type = map(object({
    app_service_plan_id             = string
    location                        = string
    name                            = string
    resource_group_name             = string
    storage_account_access_key      = string
    storage_account_name            = string
    app_settings                    = optional(map(string))
    client_cert_mode                = optional(string)
    daily_memory_time_quota         = optional(number)
    enable_builtin_logging          = optional(bool)
    enabled                         = optional(bool)
    https_only                      = optional(bool)
    key_vault_reference_identity_id = optional(string)
    os_type                         = optional(string)
    tags                            = optional(map(string))
    version                         = optional(string)
    auth_settings                   = optional(list(object({
            enabled                        = bool
            additional_login_params        = optional(map(string))
            allowed_external_redirect_urls = optional(list(string))
            default_provider               = optional(string)
            issuer                         = optional(string)
            runtime_version                = optional(string)
            token_refresh_extension_hours  = optional(number)
            token_store_enabled            = optional(bool)
            unauthenticated_client_action  = optional(string)
            active_directory               = optional(list(object({
                client_id         = string
                allowed_audiences = optional(list(string))
                client_secret     = optional(string)
            })))
            facebook                       = optional(list(object({
                app_id       = string
                app_secret   = string
                oauth_scopes = optional(list(string))
            })))
            google                         = optional(list(object({
                client_id     = string
                client_secret = string
                oauth_scopes  = optional(list(string))
            })))
            microsoft                      = optional(list(object({
                client_id     = string
                client_secret = string
                oauth_scopes  = optional(list(string))
            })))
            twitter                        = optional(list(object({
                consumer_key    = string
                consumer_secret = string
            })))
        })))
    connection_string               = optional(set(object({
            name  = string
            type  = string
            value = string
        })))
    identity                        = optional(list(object({
            type         = string
            identity_ids = optional(set(string))
        })))
    site_config                     = optional(list(object({
            always_on                        = optional(bool)
            app_scale_limit                  = optional(number)
            auto_swap_slot_name              = optional(string)
            dotnet_framework_version         = optional(string)
            elastic_instance_minimum         = optional(number)
            ftps_state                       = optional(string)
            health_check_path                = optional(string)
            http2_enabled                    = optional(bool)
            ip_restriction                   = optional(list(object({
                action = string
                headers = list(object({
                    x_azure_fdid = set(string)
                    x_fd_health_probe = set(string)
                    x_forwarded_for = set(string)
                    x_forwarded_host = set(string)
                }))
                ip_address = string
                name = string
                priority = number
                service_tag = string
                virtual_network_subnet_id = string
            })))
            java_version                     = optional(string)
            linux_fx_version                 = optional(string)
            min_tls_version                  = optional(string)
            pre_warmed_instance_count        = optional(number)
            runtime_scale_monitoring_enabled = optional(bool)
            scm_ip_restriction               = optional(list(object({
                action = string
                headers = list(object({
                    x_azure_fdid = set(string)
                    x_fd_health_probe = set(string)
                    x_forwarded_for = set(string)
                    x_forwarded_host = set(string)
                }))
                ip_address = string
                name = string
                priority = number
                service_tag = string
                virtual_network_subnet_id = string
            })))
            scm_type                         = optional(string)
            scm_use_main_ip_restriction      = optional(bool)
            use_32_bit_worker_process        = optional(bool)
            vnet_route_all_enabled           = optional(bool)
            websockets_enabled               = optional(bool)
            cors                             = optional(list(object({
                allowed_origins     = set(string)
                support_credentials = optional(bool)
            })))
        })))
    source_control                  = optional(list(object({
            branch             = optional(string)
            manual_integration = optional(bool)
            repo_url           = optional(string)
            rollback_enabled   = optional(bool)
            use_mercurial      = optional(bool)
        })))
  }))
}
