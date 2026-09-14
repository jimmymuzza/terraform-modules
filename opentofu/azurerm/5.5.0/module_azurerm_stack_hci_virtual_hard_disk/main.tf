resource "azurerm_stack_hci_virtual_hard_disk" "stack_hci_virtual_hard_disks" {
  for_each = var.stack_hci_virtual_hard_disks

  custom_location_id       = each.value.custom_location_id
  disk_size_in_gb          = each.value.disk_size_in_gb
  location                 = each.value.location
  name                     = each.value.name
  resource_group_name      = each.value.resource_group_name
  block_size_in_bytes      = each.value.block_size_in_bytes
  disk_file_format         = each.value.disk_file_format
  dynamic_enabled          = each.value.dynamic_enabled
  hyperv_generation        = each.value.hyperv_generation
  logical_sector_in_bytes  = each.value.logical_sector_in_bytes
  physical_sector_in_bytes = each.value.physical_sector_in_bytes
  storage_path_id          = each.value.storage_path_id
  tags                     = each.value.tags
}
