resource "azurerm_site_recovery_vmware_replicated_vm" "site_recovery_vmware_replicated_vms" {
  for_each = var.site_recovery_vmware_replicated_vms

  appliance_name                             = each.value.appliance_name
  name                                       = each.value.name
  physical_server_credential_name            = each.value.physical_server_credential_name
  recovery_replication_policy_id             = each.value.recovery_replication_policy_id
  recovery_vault_id                          = each.value.recovery_vault_id
  source_vm_name                             = each.value.source_vm_name
  target_resource_group_id                   = each.value.target_resource_group_id
  target_vm_name                             = each.value.target_vm_name
  default_log_storage_account_id             = each.value.default_log_storage_account_id
  default_recovery_disk_type                 = each.value.default_recovery_disk_type
  default_target_disk_encryption_set_id      = each.value.default_target_disk_encryption_set_id
  license_type                               = each.value.license_type
  multi_vm_group_name                        = each.value.multi_vm_group_name
  target_availability_set_id                 = each.value.target_availability_set_id
  target_boot_diagnostics_storage_account_id = each.value.target_boot_diagnostics_storage_account_id
  target_network_id                          = each.value.target_network_id
  target_proximity_placement_group_id        = each.value.target_proximity_placement_group_id
  target_vm_size                             = each.value.target_vm_size
  target_zone                                = each.value.target_zone
  test_network_id                            = each.value.test_network_id

  dynamic "managed_disk" {
    for_each = each.value.managed_disk != null ? each.value.managed_disk : []
    content {
      disk_id                       = managed_disk.value.disk_id
      target_disk_type              = managed_disk.value.target_disk_type
      log_storage_account_id        = managed_disk.value.log_storage_account_id
      target_disk_encryption_set_id = managed_disk.value.target_disk_encryption_set_id
    }
  }

  dynamic "network_interface" {
    for_each = each.value.network_interface != null ? each.value.network_interface : []
    content {
      is_primary         = network_interface.value.is_primary
      source_mac_address = network_interface.value.source_mac_address
      target_static_ip   = network_interface.value.target_static_ip
      target_subnet_name = network_interface.value.target_subnet_name
      test_subnet_name   = network_interface.value.test_subnet_name
    }
  }
}
