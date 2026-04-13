variable "app_services" {
  description = <<EOT
Map of app_services, attributes below
Required:
    - app_service_plan_id
    - location
    - name
    - resource_group_name
Optional:
    - app_settings
    - client_affinity_enabled
    - client_cert_enabled
    - client_cert_mode
    - enabled
    - https_only
    - key_vault_reference_identity_id
    - tags
    - auth_settings
    - backup
    - connection_string
    - identity
    - logs
    - site_config
    - source_control
    - storage_account
EOT

  type = map(object({
    app_service_plan_id             = string
    location                        = string
    name                            = string
    resource_group_name             = string
    app_settings                    = optional(map(string))
    client_affinity_enabled         = optional(bool)
    client_cert_enabled             = optional(bool)
    client_cert_mode                = optional(string)
    enabled                         = optional(bool)
    https_only                      = optional(bool)
    key_vault_reference_identity_id = optional(string)
    tags                            = optional(map(string))
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
    backup                          = optional(list(object({
            name                = string
            storage_account_url = string
            enabled             = optional(bool)
            schedule            = list(object({
                frequency_interval       = number
                frequency_unit           = string
                keep_at_least_one_backup = optional(bool)
                retention_period_in_days = optional(number)
                start_time               = optional(string)
            }))
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
    logs                            = optional(list(object({
            detailed_error_messages_enabled = optional(bool)
            failed_request_tracing_enabled  = optional(bool)
            application_logs                = optional(list(object({
                file_system_level  = optional(string)
                azure_blob_storage = optional(list(object({
                    level             = string
                    retention_in_days = number
                    sas_url           = string
                })))
            })))
            http_logs                       = optional(list(object({
                azure_blob_storage = optional(list(object({
                    retention_in_days = number
                    sas_url           = string
                })))
                file_system        = optional(list(object({
                    retention_in_days = number
                    retention_in_mb   = number
                })))
            })))
        })))
    site_config                     = optional(list(object({
            acr_use_managed_identity_credentials = optional(bool)
            acr_user_managed_identity_client_id  = optional(string)
            always_on                            = optional(bool)
            app_command_line                     = optional(string)
            auto_swap_slot_name                  = optional(string)
            default_documents                    = optional(list(string))
            dotnet_framework_version             = optional(string)
            ftps_state                           = optional(string)
            health_check_path                    = optional(string)
            http2_enabled                        = optional(bool)
            ip_restriction                       = optional(list(object({
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
            java_container                       = optional(string)
            java_container_version               = optional(string)
            java_version                         = optional(string)
            linux_fx_version                     = optional(string)
            local_mysql_enabled                  = optional(bool)
            managed_pipeline_mode                = optional(string)
            min_tls_version                      = optional(string)
            number_of_workers                    = optional(number)
            php_version                          = optional(string)
            python_version                       = optional(string)
            remote_debugging_enabled             = optional(bool)
            remote_debugging_version             = optional(string)
            scm_ip_restriction                   = optional(list(object({
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
            scm_type                             = optional(string)
            scm_use_main_ip_restriction          = optional(bool)
            use_32_bit_worker_process            = optional(bool)
            vnet_route_all_enabled               = optional(bool)
            websockets_enabled                   = optional(bool)
            windows_fx_version                   = optional(string)
            cors                                 = optional(list(object({
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
    storage_account                 = optional(set(object({
            access_key   = string
            account_name = string
            name         = string
            share_name   = string
            type         = string
            mount_path   = optional(string)
        })))
  }))
}
