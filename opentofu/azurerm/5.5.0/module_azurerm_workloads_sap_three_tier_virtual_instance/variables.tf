variable "workloads_sap_three_tier_virtual_instances" {
  description = <<EOT
Map of workloads_sap_three_tier_virtual_instances, attributes below
Required:
    - app_location
    - environment
    - location
    - name
    - resource_group_name
    - sap_fqdn
    - sap_product
    - three_tier_configuration
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
    three_tier_configuration              = list(object({
            app_resource_group_name          = string
            high_availability_type           = optional(string)
            secondary_ip_enabled             = optional(bool)
            application_server_configuration = list(object({
                instance_count                = number
                subnet_id                     = string
                virtual_machine_configuration = list(object({
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
            }))
            central_server_configuration     = list(object({
                instance_count                = number
                subnet_id                     = string
                virtual_machine_configuration = list(object({
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
            }))
            database_server_configuration    = list(object({
                instance_count                = number
                subnet_id                     = string
                database_type                 = optional(string)
                disk_volume_configuration     = optional(set(object({
                    number_of_disks = number
                    size_in_gb      = number
                    sku_name        = string
                    volume_name     = string
                })))
                virtual_machine_configuration = list(object({
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
            }))
            resource_names                   = optional(list(object({
                application_server = optional(list(object({
                    availability_set_name = optional(string)
                    virtual_machine       = optional(list(object({
                        host_name               = optional(string)
                        network_interface_names = optional(list(string))
                        os_disk_name            = optional(string)
                        virtual_machine_name    = optional(string)
                        data_disk               = optional(set(object({
                            names       = list(string)
                            volume_name = string
                        })))
                    })))
                })))
                central_server     = optional(list(object({
                    availability_set_name = optional(string)
                    load_balancer         = optional(list(object({
                        backend_pool_names              = optional(list(string))
                        frontend_ip_configuration_names = optional(list(string))
                        health_probe_names              = optional(list(string))
                        name                            = optional(string)
                    })))
                    virtual_machine       = optional(list(object({
                        host_name               = optional(string)
                        network_interface_names = optional(list(string))
                        os_disk_name            = optional(string)
                        virtual_machine_name    = optional(string)
                        data_disk               = optional(set(object({
                            names       = list(string)
                            volume_name = string
                        })))
                    })))
                })))
                database_server    = optional(list(object({
                    availability_set_name = optional(string)
                    load_balancer         = optional(list(object({
                        backend_pool_names              = optional(list(string))
                        frontend_ip_configuration_names = optional(list(string))
                        health_probe_names              = optional(list(string))
                        name                            = optional(string)
                    })))
                    virtual_machine       = optional(list(object({
                        host_name               = optional(string)
                        network_interface_names = optional(list(string))
                        os_disk_name            = optional(string)
                        virtual_machine_name    = optional(string)
                        data_disk               = optional(set(object({
                            names       = list(string)
                            volume_name = string
                        })))
                    })))
                })))
                shared_storage     = optional(list(object({
                    account_name          = optional(string)
                    private_endpoint_name = optional(string)
                })))
            })))
            transport_create_and_mount       = optional(list(object({
                resource_group_id    = optional(string)
                storage_account_name = optional(string)
            })))
        }))
  }))
}
