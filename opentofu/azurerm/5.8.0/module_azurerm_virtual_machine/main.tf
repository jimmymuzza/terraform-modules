resource "azurerm_virtual_machine" "virtual_machines" {
  for_each = var.virtual_machines

  location                         = each.value.location
  name                             = each.value.name
  network_interface_ids            = each.value.network_interface_ids
  resource_group_name              = each.value.resource_group_name
  vm_size                          = each.value.vm_size
  availability_set_id              = each.value.availability_set_id
  delete_data_disks_on_termination = each.value.delete_data_disks_on_termination
  delete_os_disk_on_termination    = each.value.delete_os_disk_on_termination
  license_type                     = each.value.license_type
  primary_network_interface_id     = each.value.primary_network_interface_id
  proximity_placement_group_id     = each.value.proximity_placement_group_id
  tags                             = each.value.tags
  zones                            = each.value.zones

  dynamic "additional_capabilities" {
    for_each = each.value.additional_capabilities != null ? each.value.additional_capabilities : []
    content {
      ultra_ssd_enabled = additional_capabilities.value.ultra_ssd_enabled
    }
  }

  dynamic "boot_diagnostics" {
    for_each = each.value.boot_diagnostics != null ? each.value.boot_diagnostics : []
    content {
      enabled     = boot_diagnostics.value.enabled
      storage_uri = boot_diagnostics.value.storage_uri
    }
  }

  dynamic "identity" {
    for_each = each.value.identity != null ? each.value.identity : []
    content {
      type         = identity.value.type
      identity_ids = identity.value.identity_ids
    }
  }

  dynamic "os_profile" {
    for_each = each.value.os_profile != null ? each.value.os_profile : []
    content {
      admin_username = os_profile.value.admin_username
      computer_name  = os_profile.value.computer_name
      admin_password = os_profile.value.admin_password
      custom_data    = os_profile.value.custom_data
    }
  }

  dynamic "os_profile_linux_config" {
    for_each = each.value.os_profile_linux_config != null ? each.value.os_profile_linux_config : []
    content {
      disable_password_authentication = os_profile_linux_config.value.disable_password_authentication

      dynamic "ssh_keys" {
        for_each = os_profile_linux_config.value.ssh_keys != null ? os_profile_linux_config.value.ssh_keys : []
        content {
          key_data = ssh_keys.value.key_data
          path     = ssh_keys.value.path
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
      timezone                  = os_profile_windows_config.value.timezone

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

  dynamic "storage_data_disk" {
    for_each = each.value.storage_data_disk != null ? each.value.storage_data_disk : []
    content {
      create_option             = storage_data_disk.value.create_option
      lun                       = storage_data_disk.value.lun
      name                      = storage_data_disk.value.name
      caching                   = storage_data_disk.value.caching
      disk_size_gb              = storage_data_disk.value.disk_size_gb
      managed_disk_id           = storage_data_disk.value.managed_disk_id
      managed_disk_type         = storage_data_disk.value.managed_disk_type
      vhd_uri                   = storage_data_disk.value.vhd_uri
      write_accelerator_enabled = storage_data_disk.value.write_accelerator_enabled
    }
  }

  dynamic "storage_image_reference" {
    for_each = each.value.storage_image_reference != null ? each.value.storage_image_reference : []
    content {
      offer     = storage_image_reference.value.offer
      publisher = storage_image_reference.value.publisher
      sku       = storage_image_reference.value.sku
      version   = storage_image_reference.value.version
    }
  }

  dynamic "storage_os_disk" {
    for_each = each.value.storage_os_disk != null ? each.value.storage_os_disk : []
    content {
      create_option             = storage_os_disk.value.create_option
      name                      = storage_os_disk.value.name
      caching                   = storage_os_disk.value.caching
      disk_size_gb              = storage_os_disk.value.disk_size_gb
      image_uri                 = storage_os_disk.value.image_uri
      managed_disk_id           = storage_os_disk.value.managed_disk_id
      managed_disk_type         = storage_os_disk.value.managed_disk_type
      os_type                   = storage_os_disk.value.os_type
      vhd_uri                   = storage_os_disk.value.vhd_uri
      write_accelerator_enabled = storage_os_disk.value.write_accelerator_enabled
    }
  }
}
