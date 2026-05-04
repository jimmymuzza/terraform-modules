variable "system_center_virtual_machine_manager_virtual_machine_instances" {
  description = <<EOT
Map of system_center_virtual_machine_manager_virtual_machine_instances, attributes below
Required:
    - custom_location_id
    - scoped_resource_id
    - infrastructure
Optional:
    - system_center_virtual_machine_manager_availability_set_ids
    - hardware
    - network_interface
    - operating_system
    - storage_disk
EOT

  type = map(object({
    custom_location_id                                         = string
    scoped_resource_id                                         = string
    system_center_virtual_machine_manager_availability_set_ids = optional(list(string))
    hardware                                                   = optional(list(object({
            cpu_count                       = optional(number)
            dynamic_memory_max_in_mb        = optional(number)
            dynamic_memory_min_in_mb        = optional(number)
            limit_cpu_for_migration_enabled = optional(bool)
            memory_in_mb                    = optional(number)
        })))
    infrastructure                                             = list(object({
            checkpoint_type                                                 = optional(string)
            system_center_virtual_machine_manager_cloud_id                  = optional(string)
            system_center_virtual_machine_manager_inventory_item_id         = optional(string)
            system_center_virtual_machine_manager_template_id               = optional(string)
            system_center_virtual_machine_manager_virtual_machine_server_id = optional(string)
        }))
    network_interface                                          = optional(list(object({
            name               = string
            ipv4_address_type  = optional(string)
            ipv6_address_type  = optional(string)
            mac_address_type   = optional(string)
            virtual_network_id = optional(string)
        })))
    operating_system                                           = optional(list(object({
            admin_password = optional(string)
            computer_name  = optional(string)
        })))
    storage_disk                                               = optional(list(object({
            bus                     = optional(number)
            bus_type                = optional(string)
            disk_size_gb            = optional(number)
            lun                     = optional(number)
            name                    = optional(string)
            storage_qos_policy_name = optional(string)
            template_disk_id        = optional(string)
            vhd_type                = optional(string)
        })))
  }))
}
