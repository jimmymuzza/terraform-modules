variable "orchestrated_virtual_machine_scale_sets" {
  description = <<EOT
Map of orchestrated_virtual_machine_scale_sets, attributes below
Required:
    - location
    - name
    - platform_fault_domain_count
    - resource_group_name
Optional:
    - capacity_reservation_group_id
    - encryption_at_host_enabled
    - eviction_policy
    - extension_operations_enabled
    - extensions_time_budget
    - instances
    - license_type
    - max_bid_price
    - network_api_version
    - priority
    - proximity_placement_group_id
    - single_placement_group
    - sku_name
    - source_image_id
    - tags
    - upgrade_mode
    - user_data_base64
    - zone_balance
    - zones
    - additional_capabilities
    - automatic_instance_repair
    - boot_diagnostics
    - data_disk
    - extension
    - identity
    - network_interface
    - os_disk
    - os_profile
    - plan
    - priority_mix
    - rolling_upgrade_policy
    - sku_profile
    - source_image_reference
    - termination_notification
EOT

  type = map(object({
    location                      = string
    name                          = string
    platform_fault_domain_count   = number
    resource_group_name           = string
    capacity_reservation_group_id = optional(string)
    encryption_at_host_enabled    = optional(bool)
    eviction_policy               = optional(string)
    extension_operations_enabled  = optional(bool)
    extensions_time_budget        = optional(string)
    instances                     = optional(number)
    license_type                  = optional(string)
    max_bid_price                 = optional(number)
    network_api_version           = optional(string)
    priority                      = optional(string)
    proximity_placement_group_id  = optional(string)
    single_placement_group        = optional(bool)
    sku_name                      = optional(string)
    source_image_id               = optional(string)
    tags                          = optional(map(string))
    upgrade_mode                  = optional(string)
    user_data_base64              = optional(string)
    zone_balance                  = optional(bool)
    zones                         = optional(set(string))
    additional_capabilities       = optional(list(object({
            ultra_ssd_enabled = optional(bool)
        })))
    automatic_instance_repair     = optional(list(object({
            enabled      = bool
            action       = optional(string)
            grace_period = optional(string)
        })))
    boot_diagnostics              = optional(list(object({
            storage_account_uri = optional(string)
        })))
    data_disk                     = optional(list(object({
            caching                        = string
            storage_account_type           = string
            create_option                  = optional(string)
            disk_encryption_set_id         = optional(string)
            disk_size_gb                   = optional(number)
            lun                            = optional(number)
            ultra_ssd_disk_iops_read_write = optional(number)
            ultra_ssd_disk_mbps_read_write = optional(number)
            write_accelerator_enabled      = optional(bool)
        })))
    extension                     = optional(set(object({
            name                                      = string
            publisher                                 = string
            type                                      = string
            type_handler_version                      = string
            auto_upgrade_minor_version_enabled        = optional(bool)
            extensions_to_provision_after_vm_creation = optional(list(string))
            failure_suppression_enabled               = optional(bool)
            force_extension_execution_on_change       = optional(string)
            protected_settings                        = optional(string)
            settings                                  = optional(string)
            protected_settings_from_key_vault         = optional(list(object({
                secret_url      = string
                source_vault_id = string
            })))
        })))
    identity                      = optional(list(object({
            identity_ids = set(string)
            type         = string
        })))
    network_interface             = optional(list(object({
            name                          = string
            auxiliary_mode                = optional(string)
            auxiliary_sku                 = optional(string)
            dns_servers                   = optional(list(string))
            enable_accelerated_networking = optional(bool)
            enable_ip_forwarding          = optional(bool)
            network_security_group_id     = optional(string)
            primary                       = optional(bool)
            ip_configuration              = list(object({
                name                                         = string
                application_gateway_backend_address_pool_ids = optional(set(string))
                application_security_group_ids               = optional(set(string))
                load_balancer_backend_address_pool_ids       = optional(set(string))
                primary                                      = optional(bool)
                subnet_id                                    = optional(string)
                version                                      = optional(string)
                public_ip_address                            = optional(list(object({
                    name                    = string
                    domain_name_label       = optional(string)
                    idle_timeout_in_minutes = optional(number)
                    public_ip_prefix_id     = optional(string)
                    sku_name                = optional(string)
                    version                 = optional(string)
                    ip_tag                  = optional(list(object({
                        tag  = string
                        type = string
                    })))
                })))
            }))
        })))
    os_disk                       = optional(list(object({
            caching                   = string
            storage_account_type      = string
            disk_encryption_set_id    = optional(string)
            disk_size_gb              = optional(number)
            write_accelerator_enabled = optional(bool)
            diff_disk_settings        = optional(list(object({
                option    = string
                placement = optional(string)
            })))
        })))
    os_profile                    = optional(list(object({
            custom_data           = optional(string)
            linux_configuration   = optional(list(object({
                admin_username                  = string
                admin_password                  = optional(string)
                computer_name_prefix            = optional(string)
                disable_password_authentication = optional(bool)
                patch_assessment_mode           = optional(string)
                patch_mode                      = optional(string)
                provision_vm_agent              = optional(bool)
                admin_ssh_key                   = optional(set(object({
                    public_key = string
                    username   = string
                })))
                secret                          = optional(list(object({
                    key_vault_id = string
                    certificate  = set(object({
                        url = string
                    }))
                })))
            })))
            windows_configuration = optional(list(object({
                admin_password              = string
                admin_username              = string
                computer_name_prefix        = optional(string)
                enable_automatic_updates    = optional(bool)
                hotpatching_enabled         = optional(bool)
                patch_assessment_mode       = optional(string)
                patch_mode                  = optional(string)
                provision_vm_agent          = optional(bool)
                timezone                    = optional(string)
                additional_unattend_content = optional(list(object({
                    content = string
                    setting = string
                })))
                secret                      = optional(list(object({
                    key_vault_id = string
                    certificate  = set(object({
                        store = string
                        url   = string
                    }))
                })))
                winrm_listener              = optional(set(object({
                    protocol        = string
                    certificate_url = optional(string)
                })))
            })))
        })))
    plan                          = optional(list(object({
            name      = string
            product   = string
            publisher = string
        })))
    priority_mix                  = optional(list(object({
            base_regular_count            = optional(number)
            regular_percentage_above_base = optional(number)
        })))
    rolling_upgrade_policy        = optional(list(object({
            max_batch_instance_percent              = number
            max_unhealthy_instance_percent          = number
            max_unhealthy_upgraded_instance_percent = number
            pause_time_between_batches              = string
            cross_zone_upgrades_enabled             = optional(bool)
            maximum_surge_instances_enabled         = optional(bool)
            prioritize_unhealthy_instances_enabled  = optional(bool)
        })))
    sku_profile                   = optional(list(object({
            allocation_strategy  = string
            vm_sizes             = optional(set(string))
            virtual_machine_size = optional(set(object({
                name = string
                rank = optional(number)
            })))
        })))
    source_image_reference        = optional(list(object({
            offer     = string
            publisher = string
            sku       = string
            version   = string
        })))
    termination_notification      = optional(list(object({
            enabled = bool
            timeout = optional(string)
        })))
  }))
}
