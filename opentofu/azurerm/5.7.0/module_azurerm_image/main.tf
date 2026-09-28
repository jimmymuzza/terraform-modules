resource "azurerm_image" "images" {
  for_each = var.images

  location                  = each.value.location
  name                      = each.value.name
  resource_group_name       = each.value.resource_group_name
  hyper_v_generation        = each.value.hyper_v_generation
  source_virtual_machine_id = each.value.source_virtual_machine_id
  tags                      = each.value.tags
  zone_resilient            = each.value.zone_resilient

  dynamic "data_disk" {
    for_each = each.value.data_disk != null ? each.value.data_disk : []
    content {
      storage_type           = data_disk.value.storage_type
      blob_uri               = data_disk.value.blob_uri
      caching                = data_disk.value.caching
      disk_encryption_set_id = data_disk.value.disk_encryption_set_id
      lun                    = data_disk.value.lun
      managed_disk_id        = data_disk.value.managed_disk_id
      size_gb                = data_disk.value.size_gb
    }
  }

  dynamic "os_disk" {
    for_each = each.value.os_disk != null ? each.value.os_disk : []
    content {
      storage_type           = os_disk.value.storage_type
      blob_uri               = os_disk.value.blob_uri
      caching                = os_disk.value.caching
      disk_encryption_set_id = os_disk.value.disk_encryption_set_id
      managed_disk_id        = os_disk.value.managed_disk_id
      os_state               = os_disk.value.os_state
      os_type                = os_disk.value.os_type
      size_gb                = os_disk.value.size_gb
    }
  }
}
