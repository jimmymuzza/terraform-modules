variable "virtual_machine_scale_sets" {
  description = <<EOT
Map of virtual_machine_scale_sets, attributes below
Required:
    - location
    - name
    - resource_group_name
    - upgrade_policy_mode
    - network_profile
    - os_profile
    - sku
    - storage_profile_os_disk
Optional:
    - automatic_os_upgrade
    - eviction_policy
    - health_probe_id
    - license_type
    - overprovision
    - priority
    - proximity_placement_group_id
    - single_placement_group
    - tags
    - zones
    - boot_diagnostics
    - extension
    - identity
    - os_profile_linux_config
    - os_profile_secrets
    - os_profile_windows_config
    - plan
    - rolling_upgrade_policy
    - storage_profile_data_disk
    - storage_profile_image_reference
EOT

  type = map(object({
    location                        = string
    name                            = string
    resource_group_name             = string
    upgrade_policy_mode             = string
    automatic_os_upgrade            = optional(bool)
    eviction_policy                 = optional(string)
    health_probe_id                 = optional(string)
    license_type                    = optional(string)
    overprovision                   = optional(bool)
    priority                        = optional(string)
    proximity_placement_group_id    = optional(string)
    single_placement_group          = optional(bool)
    tags                            = optional(map(string))
    zones                           = optional(list(string))
    boot_diagnostics                = optional(list(object({
            storage_uri = string
            enabled     = optional(bool)
        })))
    extension                       = optional(set(object({
            name                       = string
            publisher                  = string
            type                       = string
            type_handler_version       = string
            auto_upgrade_minor_version = optional(bool)
            protected_settings         = optional(string)
            provision_after_extensions = optional(set(string))
            settings                   = optional(string)
        })))
    identity                        = optional(list(object({
            type         = string
            identity_ids = optional(set(string))
        })))
    network_profile                 = set(object({
            name                      = string
            primary                   = bool
            accelerated_networking    = optional(bool)
            ip_forwarding             = optional(bool)
            network_security_group_id = optional(string)
            dns_settings              = optional(list(object({
                dns_servers = list(string)
            })))
            ip_configuration          = list(object({
                name                                         = string
                primary                                      = bool
                subnet_id                                    = string
                application_gateway_backend_address_pool_ids = optional(set(string))
                application_security_group_ids               = optional(set(string))
                load_balancer_backend_address_pool_ids       = optional(set(string))
                load_balancer_inbound_nat_rules_ids          = optional(set(string))
                public_ip_address_configuration              = optional(list(object({
                    domain_name_label = string
                    idle_timeout      = number
                    name              = string
                })))
            }))
        }))
    os_profile                      = list(object({
            admin_username       = string
            computer_name_prefix = string
            admin_password       = optional(string)
            custom_data          = optional(string)
        }))
    os_profile_linux_config         = optional(set(object({
            disable_password_authentication = optional(bool)
            ssh_keys                        = optional(list(object({
                path     = string
                key_data = optional(string)
            })))
        })))
    os_profile_secrets              = optional(set(object({
            source_vault_id    = string
            vault_certificates = optional(list(object({
                certificate_url   = string
                certificate_store = optional(string)
            })))
        })))
    os_profile_windows_config       = optional(set(object({
            enable_automatic_upgrades  = optional(bool)
            provision_vm_agent         = optional(bool)
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
    plan                            = optional(set(object({
            name      = string
            product   = string
            publisher = string
        })))
    rolling_upgrade_policy          = optional(list(object({
            max_batch_instance_percent              = optional(number)
            max_unhealthy_instance_percent          = optional(number)
            max_unhealthy_upgraded_instance_percent = optional(number)
            pause_time_between_batches              = optional(string)
        })))
    sku                             = list(object({
            capacity = number
            name     = string
            tier     = optional(string)
        }))
    storage_profile_data_disk       = optional(list(object({
            create_option     = string
            lun               = number
            caching           = optional(string)
            disk_size_gb      = optional(number)
            managed_disk_type = optional(string)
        })))
    storage_profile_image_reference = optional(set(object({
            offer     = optional(string)
            publisher = optional(string)
            sku       = optional(string)
            version   = optional(string)
        })))
    storage_profile_os_disk         = set(object({
            create_option     = string
            caching           = optional(string)
            image             = optional(string)
            managed_disk_type = optional(string)
            name              = optional(string)
            os_type           = optional(string)
            vhd_containers    = optional(set(string))
        }))
  }))
}
