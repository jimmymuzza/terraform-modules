variable "logic_app_standards" {
  description = <<EOT
Map of logic_app_standards, attributes below
Required:
    - app_service_plan_id
    - location
    - name
    - resource_group_name
    - storage_account_access_key
    - storage_account_name
Optional:
    - app_settings
    - bundle_version
    - client_affinity_enabled
    - client_certificate_mode
    - enabled
    - ftp_publish_basic_authentication_enabled
    - https_only
    - public_network_access
    - scm_publish_basic_authentication_enabled
    - storage_account_share_name
    - tags
    - use_extension_bundle
    - version
    - virtual_network_subnet_id
    - vnet_content_share_enabled
    - connection_string
    - identity
    - site_config
EOT

  type = map(object({
    app_service_plan_id                      = string
    location                                 = string
    name                                     = string
    resource_group_name                      = string
    storage_account_access_key               = string
    storage_account_name                     = string
    app_settings                             = optional(map(string))
    bundle_version                           = optional(string)
    client_affinity_enabled                  = optional(bool)
    client_certificate_mode                  = optional(string)
    enabled                                  = optional(bool)
    ftp_publish_basic_authentication_enabled = optional(bool)
    https_only                               = optional(bool)
    public_network_access                    = optional(string)
    scm_publish_basic_authentication_enabled = optional(bool)
    storage_account_share_name               = optional(string)
    tags                                     = optional(map(string))
    use_extension_bundle                     = optional(bool)
    version                                  = optional(string)
    virtual_network_subnet_id                = optional(string)
    vnet_content_share_enabled               = optional(bool)
    connection_string                        = optional(set(object({
            name  = string
            type  = string
            value = string
        })))
    identity                                 = optional(list(object({
            type         = string
            identity_ids = optional(set(string))
        })))
    site_config                              = optional(list(object({
            always_on                        = optional(bool)
            app_scale_limit                  = optional(number)
            dotnet_framework_version         = optional(string)
            elastic_instance_minimum         = optional(number)
            ftps_state                       = optional(string)
            health_check_path                = optional(string)
            http2_enabled                    = optional(bool)
            linux_fx_version                 = optional(string)
            min_tls_version                  = optional(string)
            pre_warmed_instance_count        = optional(number)
            public_network_access_enabled    = optional(bool)
            runtime_scale_monitoring_enabled = optional(bool)
            scm_min_tls_version              = optional(string)
            scm_type                         = optional(string)
            scm_use_main_ip_restriction      = optional(bool)
            use_32_bit_worker_process        = optional(bool)
            vnet_route_all_enabled           = optional(bool)
            websockets_enabled               = optional(bool)
            cors                             = optional(list(object({
                allowed_origins     = optional(set(string))
                support_credentials = optional(bool)
            })))
            ip_restriction                   = optional(list(object({
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
            scm_ip_restriction               = optional(list(object({
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
        })))
  }))
}
