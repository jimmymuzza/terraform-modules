resource "azurerm_virtual_machine_data_disk_attachment" "virtual_machine_data_disk_attachments" {
  for_each = var.virtual_machine_data_disk_attachments

  caching                   = each.value.caching
  lun                       = each.value.lun
  managed_disk_id           = each.value.managed_disk_id
  virtual_machine_id        = each.value.virtual_machine_id
  create_option             = each.value.create_option
  write_accelerator_enabled = each.value.write_accelerator_enabled
}
