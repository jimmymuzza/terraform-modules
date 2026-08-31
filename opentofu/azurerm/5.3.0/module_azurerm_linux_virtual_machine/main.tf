resource "azurerm_linux_virtual_machine" "linux_virtual_machines" {
  for_each = var.linux_virtual_machines

  location                                               = each.value.location
  name                                                   = each.value.name
  network_interface_ids                                  = each.value.network_interface_ids
  resource_group_name                                    = each.value.resource_group_name
  size                                                   = each.value.size
  admin_password                                         = each.value.admin_password
  admin_username                                         = each.value.admin_username
  allow_extension_operations                             = each.value.allow_extension_operations
  availability_set_id                                    = each.value.availability_set_id
  bypass_platform_safety_checks_on_user_schedule_enabled = each.value.bypass_platform_safety_checks_on_user_schedule_enabled
  capacity_reservation_group_id                          = each.value.capacity_reservation_group_id
  computer_name                                          = each.value.computer_name
  custom_data                                            = each.value.custom_data
  dedicated_host_group_id                                = each.value.dedicated_host_group_id
  dedicated_host_id                                      = each.value.dedicated_host_id
  disable_password_authentication                        = each.value.disable_password_authentication
  disk_controller_type                                   = each.value.disk_controller_type
  edge_zone                                              = each.value.edge_zone
  encryption_at_host_enabled                             = each.value.encryption_at_host_enabled
  eviction_policy                                        = each.value.eviction_policy
  extensions_time_budget                                 = each.value.extensions_time_budget
  license_type                                           = each.value.license_type
  max_bid_price                                          = each.value.max_bid_price
  os_managed_disk_id                                     = each.value.os_managed_disk_id
  patch_assessment_mode                                  = each.value.patch_assessment_mode
  patch_mode                                             = each.value.patch_mode
  platform_fault_domain                                  = each.value.platform_fault_domain
  priority                                               = each.value.priority
  provision_vm_agent                                     = each.value.provision_vm_agent
  proximity_placement_group_id                           = each.value.proximity_placement_group_id
  reboot_setting                                         = each.value.reboot_setting
  secure_boot_enabled                                    = each.value.secure_boot_enabled
  source_image_id                                        = each.value.source_image_id
  tags                                                   = each.value.tags
  user_data                                              = each.value.user_data
  virtual_machine_scale_set_id                           = each.value.virtual_machine_scale_set_id
  vtpm_enabled                                           = each.value.vtpm_enabled
  zone                                                   = each.value.zone

  dynamic "additional_capabilities" {
    for_each = each.value.additional_capabilities != null ? each.value.additional_capabilities : []
    content {
      hibernation_enabled = additional_capabilities.value.hibernation_enabled
      ultra_ssd_enabled   = additional_capabilities.value.ultra_ssd_enabled
    }
  }

  dynamic "admin_ssh_key" {
    for_each = each.value.admin_ssh_key != null ? each.value.admin_ssh_key : []
    content {
      public_key = admin_ssh_key.value.public_key
      username   = admin_ssh_key.value.username
    }
  }

  dynamic "boot_diagnostics" {
    for_each = each.value.boot_diagnostics != null ? each.value.boot_diagnostics : []
    content {
      storage_account_uri = boot_diagnostics.value.storage_account_uri
    }
  }

  dynamic "gallery_application" {
    for_each = each.value.gallery_application != null ? each.value.gallery_application : []
    content {
      version_id                                  = gallery_application.value.version_id
      automatic_upgrade_enabled                   = gallery_application.value.automatic_upgrade_enabled
      configuration_blob_uri                      = gallery_application.value.configuration_blob_uri
      order                                       = gallery_application.value.order
      tag                                         = gallery_application.value.tag
      treat_failure_as_deployment_failure_enabled = gallery_application.value.treat_failure_as_deployment_failure_enabled
    }
  }

  dynamic "identity" {
    for_each = each.value.identity != null ? each.value.identity : []
    content {
      type         = identity.value.type
      identity_ids = identity.value.identity_ids
    }
  }

  dynamic "os_disk" {
    for_each = each.value.os_disk != null ? each.value.os_disk : []
    content {
      caching                          = os_disk.value.caching
      disk_encryption_set_id           = os_disk.value.disk_encryption_set_id
      disk_size_gb                     = os_disk.value.disk_size_gb
      name                             = os_disk.value.name
      secure_vm_disk_encryption_set_id = os_disk.value.secure_vm_disk_encryption_set_id
      security_encryption_type         = os_disk.value.security_encryption_type
      storage_account_type             = os_disk.value.storage_account_type
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

  dynamic "os_image_notification" {
    for_each = each.value.os_image_notification != null ? each.value.os_image_notification : []
    content {
      timeout = os_image_notification.value.timeout
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

  dynamic "termination_notification" {
    for_each = each.value.termination_notification != null ? each.value.termination_notification : []
    content {
      enabled = termination_notification.value.enabled
      timeout = termination_notification.value.timeout
    }
  }
}
