variable "service_fabric_managed_clusters" {
  description = <<EOT
Map of service_fabric_managed_clusters, attributes below
Required:
    - client_connection_port
    - http_gateway_port
    - location
    - name
    - resource_group_name
    - lb_rule
Optional:
    - backup_service_enabled
    - dns_name
    - dns_service_enabled
    - password
    - sku
    - subnet_id
    - tags
    - upgrade_wave
    - username
    - authentication
    - custom_fabric_setting
    - node_type
EOT

  type = map(object({
    client_connection_port = number
    http_gateway_port      = number
    location               = string
    name                   = string
    resource_group_name    = string
    backup_service_enabled = optional(bool)
    dns_name               = optional(string)
    dns_service_enabled    = optional(bool)
    password               = optional(string)
    sku                    = optional(string)
    subnet_id              = optional(string)
    tags                   = optional(map(string))
    upgrade_wave           = optional(string)
    username               = optional(string)
    authentication         = optional(list(object({
            active_directory = optional(list(object({
                client_application_id  = string
                cluster_application_id = string
                tenant_id              = string
            })))
            certificate      = optional(list(object({
                thumbprint  = string
                type        = string
                common_name = optional(string)
            })))
        })))
    custom_fabric_setting  = optional(list(object({
            parameter = string
            section   = string
            value     = string
        })))
    lb_rule                = list(object({
            backend_port       = number
            frontend_port      = number
            probe_protocol     = string
            protocol           = string
            probe_request_path = optional(string)
        }))
    node_type              = optional(list(object({
            application_port_range            = string
            data_disk_size_gb                 = number
            ephemeral_port_range              = string
            name                              = string
            vm_image_offer                    = string
            vm_image_publisher                = string
            vm_image_sku                      = string
            vm_image_version                  = string
            vm_instance_count                 = number
            vm_size                           = string
            capacities                        = optional(map(string))
            data_disk_type                    = optional(string)
            multiple_placement_groups_enabled = optional(bool)
            placement_properties              = optional(map(string))
            primary                           = optional(bool)
            stateless                         = optional(bool)
            vm_secrets                        = optional(list(object({
                vault_id     = string
                certificates = list(object({
                    store = string
                    url   = string
                }))
            })))
        })))
  }))
}
