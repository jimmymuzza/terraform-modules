resource "azurerm_virtual_machine_scale_set" "virtual_machine_scale_sets" {
  for_each = var.virtual_machine_scale_sets

  location                     = each.value.location
  name                         = each.value.name
  resource_group_name          = each.value.resource_group_name
  upgrade_policy_mode          = each.value.upgrade_policy_mode
  automatic_os_upgrade         = each.value.automatic_os_upgrade
  eviction_policy              = each.value.eviction_policy
  health_probe_id              = each.value.health_probe_id
  license_type                 = each.value.license_type
  overprovision                = each.value.overprovision
  priority                     = each.value.priority
  proximity_placement_group_id = each.value.proximity_placement_group_id
  single_placement_group       = each.value.single_placement_group
  tags                         = each.value.tags
  zones                        = each.value.zones

  dynamic "boot_diagnostics" {
    for_each = each.value.boot_diagnostics != null ? each.value.boot_diagnostics : []
    content {
      storage_uri = boot_diagnostics.value.storage_uri
      enabled     = boot_diagnostics.value.enabled
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
      protected_settings         = extension.value.protected_settings
      provision_after_extensions = extension.value.provision_after_extensions
      settings                   = extension.value.settings
    }
  }

  dynamic "identity" {
    for_each = each.value.identity != null ? each.value.identity : []
    content {
      type         = identity.value.type
      identity_ids = identity.value.identity_ids
    }
  }

  dynamic "network_profile" {
    for_each = each.value.network_profile != null ? each.value.network_profile : []
    content {
      name                      = network_profile.value.name
      primary                   = network_profile.value.primary
      accelerated_networking    = network_profile.value.accelerated_networking
      ip_forwarding             = network_profile.value.ip_forwarding
      network_security_group_id = network_profile.value.network_security_group_id

      dynamic "dns_settings" {
        for_each = network_profile.value.dns_settings != null ? network_profile.value.dns_settings : []
        content {
          dns_servers = dns_settings.value.dns_servers
        }
      }

      dynamic "ip_configuration" {
        for_each = network_profile.value.ip_configuration != null ? network_profile.value.ip_configuration : []
        content {
          name                                         = ip_configuration.value.name
          primary                                      = ip_configuration.value.primary
          subnet_id                                    = ip_configuration.value.subnet_id
          application_gateway_backend_address_pool_ids = ip_configuration.value.application_gateway_backend_address_pool_ids
          application_security_group_ids               = ip_configuration.value.application_security_group_ids
          load_balancer_backend_address_pool_ids       = ip_configuration.value.load_balancer_backend_address_pool_ids
          load_balancer_inbound_nat_rules_ids          = ip_configuration.value.load_balancer_inbound_nat_rules_ids

          dynamic "public_ip_address_configuration" {
            for_each = ip_configuration.value.public_ip_address_configuration != null ? ip_configuration.value.public_ip_address_configuration : []
            content {
              domain_name_label = public_ip_address_configuration.value.domain_name_label
              idle_timeout      = public_ip_address_configuration.value.idle_timeout
              name              = public_ip_address_configuration.value.name
            }
          }
        }
      }
    }
  }

  dynamic "os_profile" {
    for_each = each.value.os_profile != null ? each.value.os_profile : []
    content {
      admin_username       = os_profile.value.admin_username
      computer_name_prefix = os_profile.value.computer_name_prefix
      admin_password       = os_profile.value.admin_password
      custom_data          = os_profile.value.custom_data
    }
  }

  dynamic "os_profile_linux_config" {
    for_each = each.value.os_profile_linux_config != null ? each.value.os_profile_linux_config : []
    content {
      disable_password_authentication = os_profile_linux_config.value.disable_password_authentication

      dynamic "ssh_keys" {
        for_each = os_profile_linux_config.value.ssh_keys != null ? os_profile_linux_config.value.ssh_keys : []
        content {
          path     = ssh_keys.value.path
          key_data = ssh_keys.value.key_data
        }
      }
    }
  }

  dynamic "os_profile_secrets" {
    for_each = each.value.os_profile_secrets != null ? each.value.os_profile_secrets : []
    content {
      source_vault_id = os_profile_secrets.value.source_vault_id

      dynamic "vault_certificates" {
        for_each = os_profile_secrets.value.vault_certificates != null ? os_profile_secrets.value.vault_certificates : []
        content {
          certificate_url   = vault_certificates.value.certificate_url
          certificate_store = vault_certificates.value.certificate_store
        }
      }
    }
  }

  dynamic "os_profile_windows_config" {
    for_each = each.value.os_profile_windows_config != null ? each.value.os_profile_windows_config : []
    content {
      enable_automatic_upgrades = os_profile_windows_config.value.enable_automatic_upgrades
      provision_vm_agent        = os_profile_windows_config.value.provision_vm_agent

      dynamic "additional_unattend_config" {
        for_each = os_profile_windows_config.value.additional_unattend_config != null ? os_profile_windows_config.value.additional_unattend_config : []
        content {
          component    = additional_unattend_config.value.component
          content      = additional_unattend_config.value.content
          pass         = additional_unattend_config.value.pass
          setting_name = additional_unattend_config.value.setting_name
        }
      }

      dynamic "winrm" {
        for_each = os_profile_windows_config.value.winrm != null ? os_profile_windows_config.value.winrm : []
        content {
          protocol        = winrm.value.protocol
          certificate_url = winrm.value.certificate_url
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
    }
  }

  dynamic "sku" {
    for_each = each.value.sku != null ? each.value.sku : []
    content {
      capacity = sku.value.capacity
      name     = sku.value.name
      tier     = sku.value.tier
    }
  }

  dynamic "storage_profile_data_disk" {
    for_each = each.value.storage_profile_data_disk != null ? each.value.storage_profile_data_disk : []
    content {
      create_option     = storage_profile_data_disk.value.create_option
      lun               = storage_profile_data_disk.value.lun
      caching           = storage_profile_data_disk.value.caching
      disk_size_gb      = storage_profile_data_disk.value.disk_size_gb
      managed_disk_type = storage_profile_data_disk.value.managed_disk_type
    }
  }

  dynamic "storage_profile_image_reference" {
    for_each = each.value.storage_profile_image_reference != null ? each.value.storage_profile_image_reference : []
    content {
      offer     = storage_profile_image_reference.value.offer
      publisher = storage_profile_image_reference.value.publisher
      sku       = storage_profile_image_reference.value.sku
      version   = storage_profile_image_reference.value.version
    }
  }

  dynamic "storage_profile_os_disk" {
    for_each = each.value.storage_profile_os_disk != null ? each.value.storage_profile_os_disk : []
    content {
      create_option     = storage_profile_os_disk.value.create_option
      caching           = storage_profile_os_disk.value.caching
      image             = storage_profile_os_disk.value.image
      managed_disk_type = storage_profile_os_disk.value.managed_disk_type
      name              = storage_profile_os_disk.value.name
      os_type           = storage_profile_os_disk.value.os_type
      vhd_containers    = storage_profile_os_disk.value.vhd_containers
    }
  }
}
