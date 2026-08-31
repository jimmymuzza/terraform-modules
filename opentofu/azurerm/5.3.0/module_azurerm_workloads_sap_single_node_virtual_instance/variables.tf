variable "workloads_sap_single_node_virtual_instances" {
  description = <<EOT
Map of workloads_sap_single_node_virtual_instances, attributes below
Required:
    - app_location
    - environment
    - location
    - name
    - resource_group_name
    - sap_fqdn
    - sap_product
    - single_server_configuration
Optional:
    - managed_resource_group_name
    - managed_resources_network_access_type
    - tags
    - identity
EOT

  type = map(object({
    app_location                          = string
    environment                           = string
    location                              = string
    name                                  = string
    resource_group_name                   = string
    sap_fqdn                              = string
    sap_product                           = string
    managed_resource_group_name           = optional(string)
    managed_resources_network_access_type = optional(string)
    tags                                  = optional(map(string))
    identity                              = optional(list(object({
            identity_ids = set(string)
            type         = string
        })))
    single_server_configuration           = list(object({
            app_resource_group_name        = string
            subnet_id                      = string
            database_type                  = optional(string)
            secondary_ip_enabled           = optional(bool)
            disk_volume_configuration      = optional(set(object({
                number_of_disks = number
                size_in_gb      = number
                sku_name        = string
                volume_name     = string
            })))
            virtual_machine_configuration  = list(object({
                virtual_machine_size = string
                image                = list(object({
                    offer     = string
                    publisher = string
                    sku       = string
                    version   = string
                }))
                os_profile           = list(object({
                    admin_username  = string
                    ssh_private_key = string
                    ssh_public_key  = string
                }))
            }))
            virtual_machine_resource_names = optional(list(object({
                host_name               = optional(string)
                network_interface_names = optional(list(string))
                os_disk_name            = optional(string)
                virtual_machine_name    = optional(string)
                data_disk               = optional(set(object({
                    names       = list(string)
                    volume_name = string
                })))
            })))
        }))
  }))
}
