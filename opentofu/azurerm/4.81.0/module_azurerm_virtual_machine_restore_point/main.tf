resource "azurerm_virtual_machine_restore_point" "virtual_machine_restore_points" {
  for_each = var.virtual_machine_restore_points

  name                                        = each.value.name
  virtual_machine_restore_point_collection_id = each.value.virtual_machine_restore_point_collection_id
  crash_consistency_mode_enabled              = each.value.crash_consistency_mode_enabled
  excluded_disks                              = each.value.excluded_disks
}
