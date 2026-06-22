variable "virtual_machines" {
  description = <<EOT
Map of virtual_machines, attributes below
Required:
    - location
    - name
    - network_interface_ids
    - resource_group_name
    - vm_size
    - storage_os_disk
Optional:
    - availability_set_id
    - delete_data_disks_on_termination
    - delete_os_disk_on_termination
    - license_type
    - primary_network_interface_id
    - proximity_placement_group_id
    - tags
    - zones
    - additional_capabilities
    - boot_diagnostics
    - identity
    - os_profile
    - os_profile_linux_config
    - os_profile_secrets
    - os_profile_windows_config
    - plan
    - storage_data_disk
    - storage_image_reference
EOT

  type = map(object({
    location                         = string
    name                             = string
    network_interface_ids            = list(string)
    resource_group_name              = string
    vm_size                          = string
    availability_set_id              = optional(string)
    delete_data_disks_on_termination = optional(bool)
    delete_os_disk_on_termination    = optional(bool)
    license_type                     = optional(string)
    primary_network_interface_id     = optional(string)
    proximity_placement_group_id     = optional(string)
    tags                             = optional(map(string))
    zones                            = optional(list(string))
    additional_capabilities          = optional(list(object({
            ultra_ssd_enabled = bool
        })))
    boot_diagnostics                 = optional(list(object({
            enabled     = bool
            storage_uri = string
        })))
    identity                         = optional(list(object({
            type         = string
            identity_ids = optional(set(string))
        })))
    os_profile                       = optional(set(object({
            admin_username = string
            computer_name  = string
            admin_password = optional(string)
            custom_data    = optional(string)
        })))
    os_profile_linux_config          = optional(set(object({
            disable_password_authentication = bool
            ssh_keys                        = optional(list(object({
                key_data = string
                path     = string
            })))
        })))
    os_profile_secrets               = optional(list(object({
            source_vault_id    = string
            vault_certificates = optional(list(object({
                certificate_url   = string
                certificate_store = optional(string)
            })))
        })))
    os_profile_windows_config        = optional(set(object({
            enable_automatic_upgrades  = optional(bool)
            provision_vm_agent         = optional(bool)
            timezone                   = optional(string)
            additional_unattend_config = optional(list(object({
                component    = string
                content      = string
                pass         = string
                setting_name = string
            })))
            winrm                      = optional(list(object({
                protocol        = string
                certificate_url = optional(string)
            })))
        })))
    plan                             = optional(list(object({
            name      = string
            product   = string
            publisher = string
        })))
    storage_data_disk                = optional(list(object({
            create_option             = string
            lun                       = number
            name                      = string
            caching                   = optional(string)
            disk_size_gb              = optional(number)
            managed_disk_id           = optional(string)
            managed_disk_type         = optional(string)
            vhd_uri                   = optional(string)
            write_accelerator_enabled = optional(bool)
        })))
    storage_image_reference          = optional(set(object({
            offer     = optional(string)
            publisher = optional(string)
            sku       = optional(string)
            version   = optional(string)
        })))
    storage_os_disk                  = list(object({
            create_option             = string
            name                      = string
            caching                   = optional(string)
            disk_size_gb              = optional(number)
            image_uri                 = optional(string)
            managed_disk_id           = optional(string)
            managed_disk_type         = optional(string)
            os_type                   = optional(string)
            vhd_uri                   = optional(string)
            write_accelerator_enabled = optional(bool)
        }))
  }))
}
