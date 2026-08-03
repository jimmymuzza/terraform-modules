variable "service_fabric_clusters" {
  description = <<EOT
Map of service_fabric_clusters, attributes below
Required:
    - location
    - management_endpoint
    - name
    - reliability_level
    - resource_group_name
    - upgrade_mode
    - vm_image
    - node_type
Optional:
    - add_on_features
    - cluster_code_version
    - service_fabric_zonal_upgrade_mode
    - tags
    - vmss_zonal_upgrade_mode
    - azure_active_directory
    - certificate
    - certificate_common_names
    - client_certificate_common_name
    - client_certificate_thumbprint
    - diagnostics_config
    - fabric_settings
    - reverse_proxy_certificate
    - reverse_proxy_certificate_common_names
    - upgrade_policy
EOT

  type = map(object({
    location                               = string
    management_endpoint                    = string
    name                                   = string
    reliability_level                      = string
    resource_group_name                    = string
    upgrade_mode                           = string
    vm_image                               = string
    add_on_features                        = optional(set(string))
    cluster_code_version                   = optional(string)
    service_fabric_zonal_upgrade_mode      = optional(string)
    tags                                   = optional(map(string))
    vmss_zonal_upgrade_mode                = optional(string)
    azure_active_directory                 = optional(list(object({
            client_application_id  = string
            cluster_application_id = string
            tenant_id              = string
        })))
    certificate                            = optional(list(object({
            thumbprint           = string
            x509_store_name      = string
            thumbprint_secondary = optional(string)
        })))
    certificate_common_names               = optional(list(object({
            x509_store_name = string
            common_names    = set(object({
                certificate_common_name       = string
                certificate_issuer_thumbprint = optional(string)
            }))
        })))
    client_certificate_common_name         = optional(list(object({
            common_name       = string
            is_admin          = bool
            issuer_thumbprint = optional(string)
        })))
    client_certificate_thumbprint          = optional(list(object({
            is_admin   = bool
            thumbprint = string
        })))
    diagnostics_config                     = optional(list(object({
            blob_endpoint              = string
            protected_account_key_name = string
            queue_endpoint             = string
            storage_account_name       = string
            table_endpoint             = string
        })))
    fabric_settings                        = optional(list(object({
            name       = string
            parameters = optional(map(string))
        })))
    node_type                              = list(object({
            client_endpoint_port        = number
            http_endpoint_port          = number
            instance_count              = number
            is_primary                  = bool
            name                        = string
            capacities                  = optional(map(string))
            durability_level            = optional(string)
            is_stateless                = optional(bool)
            multiple_availability_zones = optional(bool)
            placement_properties        = optional(map(string))
            reverse_proxy_endpoint_port = optional(number)
            application_ports           = optional(list(object({
                end_port   = number
                start_port = number
            })))
            ephemeral_ports             = optional(list(object({
                end_port   = number
                start_port = number
            })))
        }))
    reverse_proxy_certificate              = optional(list(object({
            thumbprint           = string
            x509_store_name      = string
            thumbprint_secondary = optional(string)
        })))
    reverse_proxy_certificate_common_names = optional(list(object({
            x509_store_name = string
            common_names    = set(object({
                certificate_common_name       = string
                certificate_issuer_thumbprint = optional(string)
            }))
        })))
    upgrade_policy                         = optional(list(object({
            force_restart_enabled             = optional(bool)
            health_check_retry_timeout        = optional(string)
            health_check_stable_duration      = optional(string)
            health_check_wait_duration        = optional(string)
            upgrade_domain_timeout            = optional(string)
            upgrade_replica_set_check_timeout = optional(string)
            upgrade_timeout                   = optional(string)
            delta_health_policy               = optional(list(object({
                max_delta_unhealthy_applications_percent         = optional(number)
                max_delta_unhealthy_nodes_percent                = optional(number)
                max_upgrade_domain_delta_unhealthy_nodes_percent = optional(number)
            })))
            health_policy                     = optional(list(object({
                max_unhealthy_applications_percent = optional(number)
                max_unhealthy_nodes_percent        = optional(number)
            })))
        })))
  }))
}
