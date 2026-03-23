variable "linux_function_apps" {
  description = <<EOT
Map of linux_function_apps, attributes below
Required:
    - location
    - name
    - resource_group_name
    - service_plan_id
    - site_config
Optional:
    - app_settings
    - builtin_logging_enabled
    - client_certificate_enabled
    - client_certificate_exclusion_paths
    - client_certificate_mode
    - content_share_force_disabled
    - daily_memory_time_quota
    - enabled
    - ftp_publish_basic_authentication_enabled
    - functions_extension_version
    - https_only
    - key_vault_reference_identity_id
    - public_network_access_enabled
    - storage_account_access_key
    - storage_account_name
    - storage_key_vault_secret_id
    - storage_uses_managed_identity
    - tags
    - virtual_network_backup_restore_enabled
    - virtual_network_subnet_id
    - vnet_image_pull_enabled
    - webdeploy_publish_basic_authentication_enabled
    - zip_deploy_file
    - auth_settings
    - auth_settings_v2
    - backup
    - connection_string
    - identity
    - sticky_settings
    - storage_account
EOT

  type = map(object({
    location                                       = string
    name                                           = string
    resource_group_name                            = string
    service_plan_id                                = string
    app_settings                                   = optional(map(string))
    builtin_logging_enabled                        = optional(bool)
    client_certificate_enabled                     = optional(bool)
    client_certificate_exclusion_paths             = optional(string)
    client_certificate_mode                        = optional(string)
    content_share_force_disabled                   = optional(bool)
    daily_memory_time_quota                        = optional(number)
    enabled                                        = optional(bool)
    ftp_publish_basic_authentication_enabled       = optional(bool)
    functions_extension_version                    = optional(string)
    https_only                                     = optional(bool)
    key_vault_reference_identity_id                = optional(string)
    public_network_access_enabled                  = optional(bool)
    storage_account_access_key                     = optional(string)
    storage_account_name                           = optional(string)
    storage_key_vault_secret_id                    = optional(string)
    storage_uses_managed_identity                  = optional(bool)
    tags                                           = optional(map(string))
    virtual_network_backup_restore_enabled         = optional(bool)
    virtual_network_subnet_id                      = optional(string)
    vnet_image_pull_enabled                        = optional(bool)
    webdeploy_publish_basic_authentication_enabled = optional(bool)
    zip_deploy_file                                = optional(string)
    auth_settings                                  = optional(list(object({
            enabled                        = bool
            additional_login_parameters    = optional(map(string))
            allowed_external_redirect_urls = optional(list(string))
            default_provider               = optional(string)
            issuer                         = optional(string)
            runtime_version                = optional(string)
            token_refresh_extension_hours  = optional(number)
            token_store_enabled            = optional(bool)
            unauthenticated_client_action  = optional(string)
            active_directory               = optional(list(object({
                client_id                  = string
                allowed_audiences          = optional(list(string))
                client_secret              = optional(string)
                client_secret_setting_name = optional(string)
            })))
            facebook                       = optional(list(object({
                app_id                  = string
                app_secret              = optional(string)
                app_secret_setting_name = optional(string)
                oauth_scopes            = optional(list(string))
            })))
            github                         = optional(list(object({
                client_id                  = string
                client_secret              = optional(string)
                client_secret_setting_name = optional(string)
                oauth_scopes               = optional(list(string))
            })))
            google                         = optional(list(object({
                client_id                  = string
                client_secret              = optional(string)
                client_secret_setting_name = optional(string)
                oauth_scopes               = optional(list(string))
            })))
            microsoft                      = optional(list(object({
                client_id                  = string
                client_secret              = optional(string)
                client_secret_setting_name = optional(string)
                oauth_scopes               = optional(list(string))
            })))
            twitter                        = optional(list(object({
                consumer_key                 = string
                consumer_secret              = optional(string)
                consumer_secret_setting_name = optional(string)
            })))
        })))
    auth_settings_v2                               = optional(list(object({
            auth_enabled                            = optional(bool)
            config_file_path                        = optional(string)
            default_provider                        = optional(string)
            excluded_paths                          = optional(list(string))
            forward_proxy_convention                = optional(string)
            forward_proxy_custom_host_header_name   = optional(string)
            forward_proxy_custom_scheme_header_name = optional(string)
            http_route_api_prefix                   = optional(string)
            require_authentication                  = optional(bool)
            require_https                           = optional(bool)
            runtime_version                         = optional(string)
            unauthenticated_action                  = optional(string)
            active_directory_v2                     = optional(list(object({
                client_id                            = string
                tenant_auth_endpoint                 = string
                allowed_applications                 = optional(list(string))
                allowed_audiences                    = optional(list(string))
                allowed_groups                       = optional(list(string))
                allowed_identities                   = optional(list(string))
                client_secret_certificate_thumbprint = optional(string)
                client_secret_setting_name           = optional(string)
                jwt_allowed_client_applications      = optional(list(string))
                jwt_allowed_groups                   = optional(list(string))
                login_parameters                     = optional(map(string))
                www_authentication_disabled          = optional(bool)
            })))
            apple_v2                                = optional(list(object({
                client_id                  = string
                client_secret_setting_name = string
            })))
            azure_static_web_app_v2                 = optional(list(object({
                client_id = string
            })))
            custom_oidc_v2                          = optional(list(object({
                client_id                     = string
                name                          = string
                openid_configuration_endpoint = string
                name_claim_type               = optional(string)
                scopes                        = optional(list(string))
            })))
            facebook_v2                             = optional(list(object({
                app_id                  = string
                app_secret_setting_name = string
                graph_api_version       = optional(string)
                login_scopes            = optional(list(string))
            })))
            github_v2                               = optional(list(object({
                client_id                  = string
                client_secret_setting_name = string
                login_scopes               = optional(list(string))
            })))
            google_v2                               = optional(list(object({
                client_id                  = string
                client_secret_setting_name = string
                allowed_audiences          = optional(list(string))
                login_scopes               = optional(list(string))
            })))
            login                                   = list(object({
                allowed_external_redirect_urls    = optional(list(string))
                cookie_expiration_convention      = optional(string)
                cookie_expiration_time            = optional(string)
                logout_endpoint                   = optional(string)
                nonce_expiration_time             = optional(string)
                preserve_url_fragments_for_logins = optional(bool)
                token_refresh_extension_time      = optional(number)
                token_store_enabled               = optional(bool)
                token_store_path                  = optional(string)
                token_store_sas_setting_name      = optional(string)
                validate_nonce                    = optional(bool)
            }))
            microsoft_v2                            = optional(list(object({
                client_id                  = string
                client_secret_setting_name = string
                allowed_audiences          = optional(list(string))
                login_scopes               = optional(list(string))
            })))
            twitter_v2                              = optional(list(object({
                consumer_key                 = string
                consumer_secret_setting_name = string
            })))
        })))
    backup                                         = optional(list(object({
            name                = string
            storage_account_url = string
            enabled             = optional(bool)
            schedule            = list(object({
                frequency_interval       = number
                frequency_unit           = string
                keep_at_least_one_backup = optional(bool)
                retention_period_days    = optional(number)
                start_time               = optional(string)
            }))
        })))
    connection_string                              = optional(set(object({
            name  = string
            type  = string
            value = string
        })))
    identity                                       = optional(list(object({
            type         = string
            identity_ids = optional(set(string))
        })))
    site_config                                    = list(object({
            always_on                                     = optional(bool)
            api_definition_url                            = optional(string)
            api_management_api_id                         = optional(string)
            app_command_line                              = optional(string)
            app_scale_limit                               = optional(number)
            application_insights_connection_string        = optional(string)
            application_insights_key                      = optional(string)
            container_registry_managed_identity_client_id = optional(string)
            container_registry_use_managed_identity       = optional(bool)
            default_documents                             = optional(list(string))
            elastic_instance_minimum                      = optional(number)
            ftps_state                                    = optional(string)
            health_check_eviction_time_in_min             = optional(number)
            health_check_path                             = optional(string)
            http2_enabled                                 = optional(bool)
            ip_restriction_default_action                 = optional(string)
            load_balancing_mode                           = optional(string)
            managed_pipeline_mode                         = optional(string)
            minimum_tls_version                           = optional(string)
            pre_warmed_instance_count                     = optional(number)
            remote_debugging_enabled                      = optional(bool)
            remote_debugging_version                      = optional(string)
            runtime_scale_monitoring_enabled              = optional(bool)
            scm_ip_restriction_default_action             = optional(string)
            scm_minimum_tls_version                       = optional(string)
            scm_use_main_ip_restriction                   = optional(bool)
            use_32_bit_worker                             = optional(bool)
            vnet_route_all_enabled                        = optional(bool)
            websockets_enabled                            = optional(bool)
            worker_count                                  = optional(number)
            app_service_logs                              = optional(list(object({
                disk_quota_mb         = optional(number)
                retention_period_days = optional(number)
            })))
            application_stack                             = optional(list(object({
                dotnet_version              = optional(string)
                java_version                = optional(string)
                node_version                = optional(string)
                powershell_core_version     = optional(string)
                python_version              = optional(string)
                use_custom_runtime          = optional(bool)
                use_dotnet_isolated_runtime = optional(bool)
                docker                      = optional(list(object({
                    image_name        = string
                    image_tag         = string
                    registry_url      = string
                    registry_password = optional(string)
                    registry_username = optional(string)
                })))
            })))
            cors                                          = optional(list(object({
                allowed_origins     = optional(set(string))
                support_credentials = optional(bool)
            })))
            ip_restriction                                = optional(list(object({
                action                    = optional(string)
                description               = optional(string)
                headers                   = optional(list(object({
                    x_azure_fdid = list(string)
                    x_fd_health_probe = list(string)
                    x_forwarded_for = list(string)
                    x_forwarded_host = list(string)
                })))
                ip_address                = optional(string)
                name                      = optional(string)
                priority                  = optional(number)
                service_tag               = optional(string)
                virtual_network_subnet_id = optional(string)
            })))
            scm_ip_restriction                            = optional(list(object({
                action                    = optional(string)
                description               = optional(string)
                headers                   = optional(list(object({
                    x_azure_fdid = list(string)
                    x_fd_health_probe = list(string)
                    x_forwarded_for = list(string)
                    x_forwarded_host = list(string)
                })))
                ip_address                = optional(string)
                name                      = optional(string)
                priority                  = optional(number)
                service_tag               = optional(string)
                virtual_network_subnet_id = optional(string)
            })))
        }))
    sticky_settings                                = optional(list(object({
            app_setting_names       = optional(list(string))
            connection_string_names = optional(list(string))
        })))
    storage_account                                = optional(set(object({
            access_key   = string
            account_name = string
            name         = string
            share_name   = string
            type         = string
            mount_path   = optional(string)
        })))
  }))
}
