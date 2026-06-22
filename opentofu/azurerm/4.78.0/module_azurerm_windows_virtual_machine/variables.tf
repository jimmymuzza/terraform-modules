variable "windows_virtual_machines" {
  description = <<EOT
Map of windows_virtual_machines, attributes below
Required:
    - location
    - name
    - network_interface_ids
    - resource_group_name
    - size
    - os_disk
Optional:
    - admin_password
    - admin_username
    - allow_extension_operations
    - automatic_updates_enabled
    - availability_set_id
    - bypass_platform_safety_checks_on_user_schedule_enabled
    - capacity_reservation_group_id
    - computer_name
    - custom_data
    - dedicated_host_group_id
    - dedicated_host_id
    - disk_controller_type
    - edge_zone
    - enable_automatic_updates
    - encryption_at_host_enabled
    - eviction_policy
    - extensions_time_budget
    - hotpatching_enabled
    - license_type
    - max_bid_price
    - os_managed_disk_id
    - patch_assessment_mode
    - patch_mode
    - platform_fault_domain
    - priority
    - provision_vm_agent
    - proximity_placement_group_id
    - reboot_setting
    - secure_boot_enabled
    - source_image_id
    - tags
    - timezone
    - user_data
    - virtual_machine_scale_set_id
    - vm_agent_platform_updates_enabled
    - vtpm_enabled
    - zone
    - additional_capabilities
    - additional_unattend_content
    - boot_diagnostics
    - gallery_application
    - identity
    - os_image_notification
    - plan
    - secret
    - source_image_reference
    - termination_notification
    - winrm_listener
EOT

  type = map(object({
    location                                               = string
    name                                                   = string
    network_interface_ids                                  = list(string)
    resource_group_name                                    = string
    size                                                   = string
    admin_password                                         = optional(string)
    admin_username                                         = optional(string)
    allow_extension_operations                             = optional(bool)
    automatic_updates_enabled                              = optional(bool)
    availability_set_id                                    = optional(string)
    bypass_platform_safety_checks_on_user_schedule_enabled = optional(bool)
    capacity_reservation_group_id                          = optional(string)
    computer_name                                          = optional(string)
    custom_data                                            = optional(string)
    dedicated_host_group_id                                = optional(string)
    dedicated_host_id                                      = optional(string)
    disk_controller_type                                   = optional(string)
    edge_zone                                              = optional(string)
    enable_automatic_updates                               = optional(bool)
    encryption_at_host_enabled                             = optional(bool)
    eviction_policy                                        = optional(string)
    extensions_time_budget                                 = optional(string)
    hotpatching_enabled                                    = optional(bool)
    license_type                                           = optional(string)
    max_bid_price                                          = optional(number)
    os_managed_disk_id                                     = optional(string)
    patch_assessment_mode                                  = optional(string)
    patch_mode                                             = optional(string)
    platform_fault_domain                                  = optional(number)
    priority                                               = optional(string)
    provision_vm_agent                                     = optional(bool)
    proximity_placement_group_id                           = optional(string)
    reboot_setting                                         = optional(string)
    secure_boot_enabled                                    = optional(bool)
    source_image_id                                        = optional(string)
    tags                                                   = optional(map(string))
    timezone                                               = optional(string)
    user_data                                              = optional(string)
    virtual_machine_scale_set_id                           = optional(string)
    vm_agent_platform_updates_enabled                      = optional(bool)
    vtpm_enabled                                           = optional(bool)
    zone                                                   = optional(string)
    additional_capabilities                                = optional(list(object({
            hibernation_enabled = optional(bool)
            ultra_ssd_enabled   = optional(bool)
        })))
    additional_unattend_content                            = optional(list(object({
            content = string
            setting = string
        })))
    boot_diagnostics                                       = optional(list(object({
            storage_account_uri = optional(string)
        })))
    gallery_application                                    = optional(list(object({
            version_id                                  = string
            automatic_upgrade_enabled                   = optional(bool)
            configuration_blob_uri                      = optional(string)
            order                                       = optional(number)
            tag                                         = optional(string)
            treat_failure_as_deployment_failure_enabled = optional(bool)
        })))
    identity                                               = optional(list(object({
            type         = string
            identity_ids = optional(set(string))
        })))
    os_disk                                                = list(object({
            caching                          = string
            disk_encryption_set_id           = optional(string)
            disk_size_gb                     = optional(number)
            name                             = optional(string)
            secure_vm_disk_encryption_set_id = optional(string)
            security_encryption_type         = optional(string)
            storage_account_type             = optional(string)
            write_accelerator_enabled        = optional(bool)
            diff_disk_settings               = optional(list(object({
                option    = string
                placement = optional(string)
            })))
        }))
    os_image_notification                                  = optional(list(object({
            timeout = optional(string)
        })))
    plan                                                   = optional(list(object({
            name      = string
            product   = string
            publisher = string
        })))
    secret                                                 = optional(list(object({
            key_vault_id = string
            certificate  = set(object({
                store = string
                url   = string
            }))
        })))
    source_image_reference                                 = optional(list(object({
            offer     = string
            publisher = string
            sku       = string
            version   = string
        })))
    termination_notification                               = optional(list(object({
            enabled = bool
            timeout = optional(string)
        })))
    winrm_listener                                         = optional(set(object({
            protocol        = string
            certificate_url = optional(string)
        })))
  }))
}
