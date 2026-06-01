variable "batch_pools" {
  description = <<EOT
Map of batch_pools, attributes below
Required:
    - account_name
    - name
    - node_agent_sku_id
    - resource_group_name
    - vm_size
    - storage_image_reference
Optional:
    - display_name
    - inter_node_communication
    - license_type
    - max_tasks_per_node
    - metadata
    - os_disk_placement
    - stop_pending_resize_operation
    - target_node_communication_mode
    - auto_scale
    - certificate
    - container_configuration
    - data_disks
    - disk_encryption
    - extensions
    - fixed_scale
    - identity
    - mount
    - network_configuration
    - node_placement
    - security_profile
    - start_task
    - task_scheduling_policy
    - user_accounts
    - windows
EOT

  type = map(object({
    account_name                   = string
    name                           = string
    node_agent_sku_id              = string
    resource_group_name            = string
    vm_size                        = string
    display_name                   = optional(string)
    inter_node_communication       = optional(string)
    license_type                   = optional(string)
    max_tasks_per_node             = optional(number)
    metadata                       = optional(map(string))
    os_disk_placement              = optional(string)
    stop_pending_resize_operation  = optional(bool)
    target_node_communication_mode = optional(string)
    auto_scale                     = optional(list(object({
            formula             = string
            evaluation_interval = optional(string)
        })))
    certificate                    = optional(list(object({
            store_location = string
            store_name     = optional(string)
            visibility     = optional(set(string))
        })))
    container_configuration        = optional(list(object({
            container_image_names = optional(set(string))
            container_registries  = optional(list(object({
                password = string
                registry_server = string
                user_assigned_identity_id = string
                user_name = string
            })))
            type                  = optional(string)
        })))
    data_disks                     = optional(list(object({
            disk_size_gb         = number
            lun                  = number
            caching              = optional(string)
            storage_account_type = optional(string)
        })))
    disk_encryption                = optional(list(object({
            disk_encryption_target = string
        })))
    extensions                     = optional(list(object({
            name                       = string
            publisher                  = string
            type                       = string
            auto_upgrade_minor_version = optional(bool)
            automatic_upgrade_enabled  = optional(bool)
            protected_settings         = optional(string)
            provision_after_extensions = optional(set(string))
            settings_json              = optional(string)
            type_handler_version       = optional(string)
        })))
    fixed_scale                    = optional(list(object({
            node_deallocation_method  = optional(string)
            resize_timeout            = optional(string)
            target_dedicated_nodes    = optional(number)
            target_low_priority_nodes = optional(number)
        })))
    identity                       = optional(list(object({
            identity_ids = set(string)
            type         = string
        })))
    mount                          = optional(list(object({
            azure_blob_file_system = optional(list(object({
                account_name        = string
                container_name      = string
                relative_mount_path = string
                account_key         = optional(string)
                blobfuse_options    = optional(string)
                identity_id         = optional(string)
                sas_key             = optional(string)
            })))
            azure_file_share       = optional(list(object({
                account_key         = string
                account_name        = string
                azure_file_url      = string
                relative_mount_path = string
                mount_options       = optional(string)
            })))
            cifs_mount             = optional(list(object({
                password            = string
                relative_mount_path = string
                source              = string
                user_name           = string
                mount_options       = optional(string)
            })))
            nfs_mount              = optional(list(object({
                relative_mount_path = string
                source              = string
                mount_options       = optional(string)
            })))
        })))
    network_configuration          = optional(list(object({
            accelerated_networking_enabled   = optional(bool)
            dynamic_vnet_assignment_scope    = optional(string)
            public_address_provisioning_type = optional(string)
            public_ips                       = optional(set(string))
            subnet_id                        = optional(string)
            endpoint_configuration           = optional(list(object({
                backend_port                 = number
                frontend_port_range          = string
                name                         = string
                protocol                     = string
                network_security_group_rules = optional(list(object({
                    access                = string
                    priority              = number
                    source_address_prefix = string
                    source_port_ranges    = optional(list(string))
                })))
            })))
        })))
    node_placement                 = optional(list(object({
            policy = optional(string)
        })))
    security_profile               = optional(list(object({
            host_encryption_enabled = optional(bool)
            secure_boot_enabled     = optional(bool)
            security_type           = optional(string)
            vtpm_enabled            = optional(bool)
        })))
    start_task                     = optional(list(object({
            command_line                  = string
            common_environment_properties = optional(map(string))
            task_retry_maximum            = optional(number)
            wait_for_success              = optional(bool)
            container                     = optional(list(object({
                image_name        = string
                run_options       = optional(string)
                working_directory = optional(string)
                registry          = optional(list(object({
                    registry_server           = string
                    password                  = optional(string)
                    user_assigned_identity_id = optional(string)
                    user_name                 = optional(string)
                })))
            })))
            resource_file                 = optional(list(object({
                auto_storage_container_name = optional(string)
                blob_prefix                 = optional(string)
                file_mode                   = optional(string)
                file_path                   = optional(string)
                http_url                    = optional(string)
                storage_container_url       = optional(string)
                user_assigned_identity_id   = optional(string)
            })))
            user_identity                 = list(object({
                user_name = optional(string)
                auto_user = optional(list(object({
                    elevation_level = optional(string)
                    scope           = optional(string)
                })))
            }))
        })))
    storage_image_reference        = list(object({
            offer     = optional(string)
            publisher = optional(string)
            sku       = optional(string)
            version   = optional(string)
        }))
    task_scheduling_policy         = optional(list(object({
            node_fill_type = optional(string)
        })))
    user_accounts                  = optional(list(object({
            elevation_level            = string
            name                       = string
            password                   = string
            linux_user_configuration   = optional(list(object({
                gid             = optional(number)
                ssh_private_key = optional(string)
                uid             = optional(number)
            })))
            windows_user_configuration = optional(list(object({
                login_mode = string
            })))
        })))
    windows                        = optional(list(object({
            enable_automatic_updates = optional(bool)
        })))
  }))
}
