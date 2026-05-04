resource "azurerm_virtual_machine_implicit_data_disk_from_source" "virtual_machine_implicit_data_disk_from_sources" {
  for_each = var.virtual_machine_implicit_data_disk_from_sources

  create_option             = each.value.create_option
  disk_size_gb              = each.value.disk_size_gb
  lun                       = each.value.lun
  name                      = each.value.name
  source_resource_id        = each.value.source_resource_id
  virtual_machine_id        = each.value.virtual_machine_id
  caching                   = each.value.caching
  write_accelerator_enabled = each.value.write_accelerator_enabled
}
