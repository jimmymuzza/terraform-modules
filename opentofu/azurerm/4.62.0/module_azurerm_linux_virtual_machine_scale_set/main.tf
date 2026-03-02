resource "azurerm_linux_virtual_machine_scale_set" "linux_virtual_machine_scale_sets" {
  for_each = var.linux_virtual_machine_scale_sets

  admin_username                                    = each.value.admin_username
  location                                          = each.value.location
  name                                              = each.value.name
  resource_group_name                               = each.value.resource_group_name
  sku                                               = each.value.sku
  admin_password                                    = each.value.admin_password
  capacity_reservation_group_id                     = each.value.capacity_reservation_group_id
  computer_name_prefix                              = each.value.computer_name_prefix
  custom_data                                       = each.value.custom_data
  disable_password_authentication                   = each.value.disable_password_authentication
  do_not_run_extensions_on_overprovisioned_machines = each.value.do_not_run_extensions_on_overprovisioned_machines
  edge_zone                                         = each.value.edge_zone
  encryption_at_host_enabled                        = each.value.encryption_at_host_enabled
  eviction_policy                                   = each.value.eviction_policy
  extension_operations_enabled                      = each.value.extension_operations_enabled
  extensions_time_budget                            = each.value.extensions_time_budget
  health_probe_id                                   = each.value.health_probe_id
  host_group_id                                     = each.value.host_group_id
  instances                                         = each.value.instances
  max_bid_price                                     = each.value.max_bid_price
  overprovision                                     = each.value.overprovision
  platform_fault_domain_count                       = each.value.platform_fault_domain_count
  priority                                          = each.value.priority
  provision_vm_agent                                = each.value.provision_vm_agent
  proximity_placement_group_id                      = each.value.proximity_placement_group_id
  resilient_vm_creation_enabled                     = each.value.resilient_vm_creation_enabled
  resilient_vm_deletion_enabled                     = each.value.resilient_vm_deletion_enabled
  secure_boot_enabled                               = each.value.secure_boot_enabled
  single_placement_group                            = each.value.single_placement_group
  source_image_id                                   = each.value.source_image_id
  tags                                              = each.value.tags
  upgrade_mode                                      = each.value.upgrade_mode
  user_data                                         = each.value.user_data
  vtpm_enabled                                      = each.value.vtpm_enabled
  zone_balance                                      = each.value.zone_balance
  zones                                             = each.value.zones

  dynamic "additional_capabilities" {
    for_each = each.value.additional_capabilities != null ? each.value.additional_capabilities : []
    content {
      ultra_ssd_enabled = additional_capabilities.value.ultra_ssd_enabled
    }
  }

  dynamic "admin_ssh_key" {
    for_each = each.value.admin_ssh_key != null ? each.value.admin_ssh_key : []
    content {
      public_key = admin_ssh_key.value.public_key
      username   = admin_ssh_key.value.username
    }
  }

  dynamic "automatic_instance_repair" {
    for_each = each.value.automatic_instance_repair != null ? each.value.automatic_instance_repair : []
    content {
      enabled      = automatic_instance_repair.value.enabled
      action       = automatic_instance_repair.value.action
      grace_period = automatic_instance_repair.value.grace_period
    }
  }

  dynamic "automatic_os_upgrade_policy" {
    for_each = each.value.automatic_os_upgrade_policy != null ? each.value.automatic_os_upgrade_policy : []
    content {
      disable_automatic_rollback  = automatic_os_upgrade_policy.value.disable_automatic_rollback
      enable_automatic_os_upgrade = automatic_os_upgrade_policy.value.enable_automatic_os_upgrade
    }
  }

  dynamic "boot_diagnostics" {
    for_each = each.value.boot_diagnostics != null ? each.value.boot_diagnostics : []
    content {
      storage_account_uri = boot_diagnostics.value.storage_account_uri
    }
  }

  dynamic "data_disk" {
    for_each = each.value.data_disk != null ? each.value.data_disk : []
    content {
      caching                        = data_disk.value.caching
      disk_size_gb                   = data_disk.value.disk_size_gb
      lun                            = data_disk.value.lun
      storage_account_type           = data_disk.value.storage_account_type
      create_option                  = data_disk.value.create_option
      disk_encryption_set_id         = data_disk.value.disk_encryption_set_id
      name                           = data_disk.value.name
      ultra_ssd_disk_iops_read_write = data_disk.value.ultra_ssd_disk_iops_read_write
      ultra_ssd_disk_mbps_read_write = data_disk.value.ultra_ssd_disk_mbps_read_write
      write_accelerator_enabled      = data_disk.value.write_accelerator_enabled
    }
  }

  dynamic "extension" {
    for_each = each.value.extension != null ? each.value.extension : []
    content {
      name                       = extension.value.name
      publisher                  = extension.value.publisher
      type                       = extension.value.type
      type_handler_version       = extension.value.type_handler_version
      auto_upgrade_minor_version = extension.value.auto_upgrade_minor_version
      automatic_upgrade_enabled  = extension.value.automatic_upgrade_enabled
      force_update_tag           = extension.value.force_update_tag
      protected_settings         = extension.value.protected_settings
      provision_after_extensions = extension.value.provision_after_extensions
      settings                   = extension.value.settings

      dynamic "protected_settings_from_key_vault" {
        for_each = extension.value.protected_settings_from_key_vault != null ? extension.value.protected_settings_from_key_vault : []
        content {
          secret_url      = protected_settings_from_key_vault.value.secret_url
          source_vault_id = protected_settings_from_key_vault.value.source_vault_id
        }
      }
    }
  }

  dynamic "gallery_application" {
    for_each = each.value.gallery_application != null ? each.value.gallery_application : []
    content {
      version_id             = gallery_application.value.version_id
      configuration_blob_uri = gallery_application.value.configuration_blob_uri
      order                  = gallery_application.value.order
      tag                    = gallery_application.value.tag
    }
  }

  dynamic "identity" {
    for_each = each.value.identity != null ? each.value.identity : []
    content {
      type         = identity.value.type
      identity_ids = identity.value.identity_ids
    }
  }

  dynamic "network_interface" {
    for_each = each.value.network_interface != null ? each.value.network_interface : []
    content {
      name                          = network_interface.value.name
      auxiliary_mode                = network_interface.value.auxiliary_mode
      auxiliary_sku                 = network_interface.value.auxiliary_sku
      dns_servers                   = network_interface.value.dns_servers
      enable_accelerated_networking = network_interface.value.enable_accelerated_networking
      enable_ip_forwarding          = network_interface.value.enable_ip_forwarding
      network_security_group_id     = network_interface.value.network_security_group_id
      primary                       = network_interface.value.primary

      dynamic "ip_configuration" {
        for_each = network_interface.value.ip_configuration != null ? network_interface.value.ip_configuration : []
        content {
          name                                         = ip_configuration.value.name
          application_gateway_backend_address_pool_ids = ip_configuration.value.application_gateway_backend_address_pool_ids
          application_security_group_ids               = ip_configuration.value.application_security_group_ids
          load_balancer_backend_address_pool_ids       = ip_configuration.value.load_balancer_backend_address_pool_ids
          load_balancer_inbound_nat_rules_ids          = ip_configuration.value.load_balancer_inbound_nat_rules_ids
          primary                                      = ip_configuration.value.primary
          subnet_id                                    = ip_configuration.value.subnet_id
          version                                      = ip_configuration.value.version

          dynamic "public_ip_address" {
            for_each = ip_configuration.value.public_ip_address != null ? ip_configuration.value.public_ip_address : []
            content {
              name                    = public_ip_address.value.name
              domain_name_label       = public_ip_address.value.domain_name_label
              idle_timeout_in_minutes = public_ip_address.value.idle_timeout_in_minutes
              public_ip_prefix_id     = public_ip_address.value.public_ip_prefix_id
              version                 = public_ip_address.value.version

              dynamic "ip_tag" {
                for_each = public_ip_address.value.ip_tag != null ? public_ip_address.value.ip_tag : []
                content {
                  tag  = ip_tag.value.tag
                  type = ip_tag.value.type
                }
              }
            }
          }
        }
      }
    }
  }

  dynamic "os_disk" {
    for_each = each.value.os_disk != null ? each.value.os_disk : []
    content {
      caching                          = os_disk.value.caching
      storage_account_type             = os_disk.value.storage_account_type
      disk_encryption_set_id           = os_disk.value.disk_encryption_set_id
      disk_size_gb                     = os_disk.value.disk_size_gb
      secure_vm_disk_encryption_set_id = os_disk.value.secure_vm_disk_encryption_set_id
      security_encryption_type         = os_disk.value.security_encryption_type
      write_accelerator_enabled        = os_disk.value.write_accelerator_enabled

      dynamic "diff_disk_settings" {
        for_each = os_disk.value.diff_disk_settings != null ? os_disk.value.diff_disk_settings : []
        content {
          option    = diff_disk_settings.value.option
          placement = diff_disk_settings.value.placement
        }
      }
    }
  }

  dynamic "plan" {
    for_each = each.value.plan != null ? each.value.plan : []
    content {
      name      = plan.value.name
      product   = plan.value.product
      publisher = plan.value.publisher
    }
  }

  dynamic "rolling_upgrade_policy" {
    for_each = each.value.rolling_upgrade_policy != null ? each.value.rolling_upgrade_policy : []
    content {
      max_batch_instance_percent              = rolling_upgrade_policy.value.max_batch_instance_percent
      max_unhealthy_instance_percent          = rolling_upgrade_policy.value.max_unhealthy_instance_percent
      max_unhealthy_upgraded_instance_percent = rolling_upgrade_policy.value.max_unhealthy_upgraded_instance_percent
      pause_time_between_batches              = rolling_upgrade_policy.value.pause_time_between_batches
      cross_zone_upgrades_enabled             = rolling_upgrade_policy.value.cross_zone_upgrades_enabled
      maximum_surge_instances_enabled         = rolling_upgrade_policy.value.maximum_surge_instances_enabled
      prioritize_unhealthy_instances_enabled  = rolling_upgrade_policy.value.prioritize_unhealthy_instances_enabled
    }
  }

  dynamic "scale_in" {
    for_each = each.value.scale_in != null ? each.value.scale_in : []
    content {
      force_deletion_enabled = scale_in.value.force_deletion_enabled
      rule                   = scale_in.value.rule
    }
  }

  dynamic "secret" {
    for_each = each.value.secret != null ? each.value.secret : []
    content {
      key_vault_id = secret.value.key_vault_id

      dynamic "certificate" {
        for_each = secret.value.certificate != null ? secret.value.certificate : []
        content {
          url = certificate.value.url
        }
      }
    }
  }

  dynamic "source_image_reference" {
    for_each = each.value.source_image_reference != null ? each.value.source_image_reference : []
    content {
      offer     = source_image_reference.value.offer
      publisher = source_image_reference.value.publisher
      sku       = source_image_reference.value.sku
      version   = source_image_reference.value.version
    }
  }

  dynamic "spot_restore" {
    for_each = each.value.spot_restore != null ? each.value.spot_restore : []
    content {
      enabled = spot_restore.value.enabled
      timeout = spot_restore.value.timeout
    }
  }

  dynamic "termination_notification" {
    for_each = each.value.termination_notification != null ? each.value.termination_notification : []
    content {
      enabled = termination_notification.value.enabled
      timeout = termination_notification.value.timeout
    }
  }
}
