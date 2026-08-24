variable "windows_virtual_machine_scale_sets" {
  description = <<EOT
Map of windows_virtual_machine_scale_sets, attributes below
Required:
    - admin_password
    - admin_username
    - instances
    - location
    - name
    - resource_group_name
    - sku
    - network_interface
    - os_disk
Optional:
    - automatic_updates_enabled
    - capacity_reservation_group_id
    - computer_name_prefix
    - custom_data
    - do_not_run_extensions_on_overprovisioned_machines
    - edge_zone
    - encryption_at_host_enabled
    - eviction_policy
    - extension_operations_enabled
    - extensions_time_budget
    - health_probe_id
    - host_group_id
    - license_type
    - max_bid_price
    - overprovision
    - platform_fault_domain_count
    - priority
    - provision_vm_agent
    - proximity_placement_group_id
    - resilient_vm_creation_enabled
    - resilient_vm_deletion_enabled
    - secure_boot_enabled
    - single_placement_group
    - source_image_id
    - tags
    - timezone
    - upgrade_mode
    - user_data
    - vtpm_enabled
    - zone_balance
    - zones
    - additional_capabilities
    - additional_unattend_content
    - automatic_instance_repair
    - automatic_os_upgrade_policy
    - boot_diagnostics
    - data_disk
    - extension
    - gallery_application
    - identity
    - plan
    - rolling_upgrade_policy
    - scale_in
    - secret
    - source_image_reference
    - spot_restore
    - termination_notification
    - winrm_listener
EOT

  type = map(object({
    admin_password                                    = string
    admin_username                                    = string
    instances                                         = number
    location                                          = string
    name                                              = string
    resource_group_name                               = string
    sku                                               = string
    automatic_updates_enabled                         = optional(bool)
    capacity_reservation_group_id                     = optional(string)
    computer_name_prefix                              = optional(string)
    custom_data                                       = optional(string)
    do_not_run_extensions_on_overprovisioned_machines = optional(bool)
    edge_zone                                         = optional(string)
    encryption_at_host_enabled                        = optional(bool)
    eviction_policy                                   = optional(string)
    extension_operations_enabled                      = optional(bool)
    extensions_time_budget                            = optional(string)
    health_probe_id                                   = optional(string)
    host_group_id                                     = optional(string)
    license_type                                      = optional(string)
    max_bid_price                                     = optional(number)
    overprovision                                     = optional(bool)
    platform_fault_domain_count                       = optional(number)
    priority                                          = optional(string)
    provision_vm_agent                                = optional(bool)
    proximity_placement_group_id                      = optional(string)
    resilient_vm_creation_enabled                     = optional(bool)
    resilient_vm_deletion_enabled                     = optional(bool)
    secure_boot_enabled                               = optional(bool)
    single_placement_group                            = optional(bool)
    source_image_id                                   = optional(string)
    tags                                              = optional(map(string))
    timezone                                          = optional(string)
    upgrade_mode                                      = optional(string)
    user_data                                         = optional(string)
    vtpm_enabled                                      = optional(bool)
    zone_balance                                      = optional(bool)
    zones                                             = optional(set(string))
    additional_capabilities                           = optional(list(object({
            ultra_ssd_enabled = optional(bool)
        })))
    additional_unattend_content                       = optional(list(object({
            content = string
            setting = string
        })))
    automatic_instance_repair                         = optional(list(object({
            enabled      = bool
            action       = optional(string)
            grace_period = optional(string)
        })))
    automatic_os_upgrade_policy                       = optional(list(object({
            automatic_os_upgrade_enabled = bool
            automatic_rollback_enabled   = bool
        })))
    boot_diagnostics                                  = optional(list(object({
            storage_account_uri = optional(string)
        })))
    data_disk                                         = optional(list(object({
            caching                   = string
            disk_size_gb              = number
            lun                       = number
            storage_account_type      = string
            create_option             = optional(string)
            disk_encryption_set_id    = optional(string)
            disk_iops_read_write      = optional(number)
            disk_mbps_read_write      = optional(number)
            name                      = optional(string)
            write_accelerator_enabled = optional(bool)
        })))
    extension                                         = optional(set(object({
            name                              = string
            publisher                         = string
            type                              = string
            type_handler_version              = string
            auto_upgrade_minor_version        = optional(bool)
            automatic_upgrade_enabled         = optional(bool)
            force_update_tag                  = optional(string)
            protected_settings                = optional(string)
            provision_after_extensions        = optional(list(string))
            settings                          = optional(string)
            protected_settings_from_key_vault = optional(list(object({
                secret_url      = string
                source_vault_id = string
            })))
        })))
    gallery_application                               = optional(list(object({
            version_id             = string
            configuration_blob_uri = optional(string)
            order                  = optional(number)
            tag                    = optional(string)
        })))
    identity                                          = optional(list(object({
            type         = string
            identity_ids = optional(set(string))
        })))
    network_interface                                 = list(object({
            name                           = string
            accelerated_networking_enabled = optional(bool)
            auxiliary_mode                 = optional(string)
            auxiliary_sku                  = optional(string)
            dns_servers                    = optional(list(string))
            ip_forwarding_enabled          = optional(bool)
            network_security_group_id      = optional(string)
            primary                        = optional(bool)
            ip_configuration               = list(object({
                name                                         = string
                application_gateway_backend_address_pool_ids = optional(set(string))
                application_security_group_ids               = optional(set(string))
                load_balancer_backend_address_pool_ids       = optional(set(string))
                load_balancer_inbound_nat_rules_ids          = optional(set(string))
                primary                                      = optional(bool)
                subnet_id                                    = optional(string)
                version                                      = optional(string)
                public_ip_address                            = optional(list(object({
                    name                    = string
                    domain_name_label       = optional(string)
                    idle_timeout_in_minutes = optional(number)
                    public_ip_prefix_id     = optional(string)
                    version                 = optional(string)
                    ip_tag                  = optional(list(object({
                        tag  = string
                        type = string
                    })))
                })))
            }))
        }))
    os_disk                                           = list(object({
            caching                          = string
            storage_account_type             = string
            disk_encryption_set_id           = optional(string)
            disk_size_gb                     = optional(number)
            secure_vm_disk_encryption_set_id = optional(string)
            security_encryption_type         = optional(string)
            write_accelerator_enabled        = optional(bool)
            diff_disk_settings               = optional(list(object({
                option    = string
                placement = optional(string)
            })))
        }))
    plan                                              = optional(list(object({
            name      = string
            product   = string
            publisher = string
        })))
    rolling_upgrade_policy                            = optional(list(object({
            max_batch_instance_percent              = number
            max_unhealthy_instance_percent          = number
            max_unhealthy_upgraded_instance_percent = number
            pause_time_between_batches              = string
            cross_zone_upgrades_enabled             = optional(bool)
            maximum_surge_instances_enabled         = optional(bool)
            prioritize_unhealthy_instances_enabled  = optional(bool)
        })))
    scale_in                                          = optional(list(object({
            force_deletion_enabled = optional(bool)
            rule                   = optional(string)
        })))
    secret                                            = optional(list(object({
            key_vault_id = string
            certificate  = set(object({
                store = string
                url   = string
            }))
        })))
    source_image_reference                            = optional(list(object({
            offer     = string
            publisher = string
            sku       = string
            version   = string
        })))
    spot_restore                                      = optional(list(object({
            enabled = optional(bool)
            timeout = optional(string)
        })))
    termination_notification                          = optional(list(object({
            enabled = bool
            timeout = optional(string)
        })))
    winrm_listener                                    = optional(set(object({
            protocol        = string
            certificate_url = optional(string)
        })))
  }))
}
