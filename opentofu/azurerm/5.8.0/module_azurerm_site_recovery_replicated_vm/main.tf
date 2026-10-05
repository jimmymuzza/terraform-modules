resource "azurerm_site_recovery_replicated_vm" "site_recovery_replicated_vms" {
  for_each = var.site_recovery_replicated_vms

  name                                      = each.value.name
  recovery_replication_policy_id            = each.value.recovery_replication_policy_id
  recovery_vault_name                       = each.value.recovery_vault_name
  resource_group_name                       = each.value.resource_group_name
  source_recovery_fabric_name               = each.value.source_recovery_fabric_name
  source_recovery_protection_container_name = each.value.source_recovery_protection_container_name
  source_vm_id                              = each.value.source_vm_id
  target_recovery_fabric_id                 = each.value.target_recovery_fabric_id
  target_recovery_protection_container_id   = each.value.target_recovery_protection_container_id
  target_resource_group_id                  = each.value.target_resource_group_id
  managed_disk                              = each.value.managed_disk
  multi_vm_group_name                       = each.value.multi_vm_group_name
  network_interface                         = each.value.network_interface
  target_availability_set_id                = each.value.target_availability_set_id
  target_boot_diagnostic_storage_account_id = each.value.target_boot_diagnostic_storage_account_id
  target_capacity_reservation_group_id      = each.value.target_capacity_reservation_group_id
  target_edge_zone                          = each.value.target_edge_zone
  target_network_id                         = each.value.target_network_id
  target_proximity_placement_group_id       = each.value.target_proximity_placement_group_id
  target_virtual_machine_scale_set_id       = each.value.target_virtual_machine_scale_set_id
  target_virtual_machine_size               = each.value.target_virtual_machine_size
  target_zone                               = each.value.target_zone
  test_network_id                           = each.value.test_network_id
  unmanaged_disk                            = each.value.unmanaged_disk
}
