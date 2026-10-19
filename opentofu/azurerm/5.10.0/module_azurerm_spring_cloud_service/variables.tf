variable "spring_cloud_services" {
  description = <<EOT
Map of spring_cloud_services, attributes below
Required:
    - location
    - name
    - resource_group_name
Optional:
    - build_agent_pool_size
    - log_stream_public_endpoint_enabled
    - managed_environment_id
    - service_registry_enabled
    - sku_name
    - sku_tier
    - tags
    - zone_redundant
    - config_server_git_setting
    - container_registry
    - default_build_service
    - marketplace
    - network
    - trace
EOT

  type = map(object({
    location                           = string
    name                               = string
    resource_group_name                = string
    build_agent_pool_size              = optional(string)
    log_stream_public_endpoint_enabled = optional(bool)
    managed_environment_id             = optional(string)
    service_registry_enabled           = optional(bool)
    sku_name                           = optional(string)
    sku_tier                           = optional(string)
    tags                               = optional(map(string))
    zone_redundant                     = optional(bool)
    config_server_git_setting          = optional(list(object({
            uri             = string
            label           = optional(string)
            search_paths    = optional(list(string))
            http_basic_auth = optional(list(object({
                password = string
                username = string
            })))
            repository      = optional(list(object({
                name            = string
                uri             = string
                label           = optional(string)
                pattern         = optional(list(string))
                search_paths    = optional(list(string))
                http_basic_auth = optional(list(object({
                    password = string
                    username = string
                })))
                ssh_auth        = optional(list(object({
                    private_key                      = string
                    host_key                         = optional(string)
                    host_key_algorithm               = optional(string)
                    strict_host_key_checking_enabled = optional(bool)
                })))
            })))
            ssh_auth        = optional(list(object({
                private_key                      = string
                host_key                         = optional(string)
                host_key_algorithm               = optional(string)
                strict_host_key_checking_enabled = optional(bool)
            })))
        })))
    container_registry                 = optional(list(object({
            name     = string
            password = string
            server   = string
            username = string
        })))
    default_build_service              = optional(list(object({
            container_registry_name = optional(string)
        })))
    marketplace                        = optional(list(object({
            plan      = string
            product   = string
            publisher = string
        })))
    network                            = optional(list(object({
            app_subnet_id                          = string
            cidr_ranges                            = list(string)
            service_runtime_subnet_id              = string
            app_network_resource_group             = optional(string)
            outbound_type                          = optional(string)
            read_timeout_seconds                   = optional(number)
            service_runtime_network_resource_group = optional(string)
        })))
    trace                              = optional(list(object({
            connection_string = optional(string)
            sample_rate       = optional(number)
        })))
  }))
}
