resource "azurerm_managed_disk" "managed_disks" {
  for_each = var.managed_disks

  create_option                     = each.value.create_option
  location                          = each.value.location
  name                              = each.value.name
  resource_group_name               = each.value.resource_group_name
  storage_account_type              = each.value.storage_account_type
  disk_access_id                    = each.value.disk_access_id
  disk_encryption_set_id            = each.value.disk_encryption_set_id
  disk_iops_read_only               = each.value.disk_iops_read_only
  disk_iops_read_write              = each.value.disk_iops_read_write
  disk_mbps_read_only               = each.value.disk_mbps_read_only
  disk_mbps_read_write              = each.value.disk_mbps_read_write
  disk_size_gb                      = each.value.disk_size_gb
  edge_zone                         = each.value.edge_zone
  gallery_image_reference_id        = each.value.gallery_image_reference_id
  hyper_v_generation                = each.value.hyper_v_generation
  image_reference_id                = each.value.image_reference_id
  logical_sector_size               = each.value.logical_sector_size
  max_shares                        = each.value.max_shares
  network_access_policy             = each.value.network_access_policy
  on_demand_bursting_enabled        = each.value.on_demand_bursting_enabled
  optimized_frequent_attach_enabled = each.value.optimized_frequent_attach_enabled
  os_type                           = each.value.os_type
  performance_plus_enabled          = each.value.performance_plus_enabled
  public_network_access_enabled     = each.value.public_network_access_enabled
  secure_vm_disk_encryption_set_id  = each.value.secure_vm_disk_encryption_set_id
  security_type                     = each.value.security_type
  source_resource_id                = each.value.source_resource_id
  source_uri                        = each.value.source_uri
  storage_account_id                = each.value.storage_account_id
  tags                              = each.value.tags
  tier                              = each.value.tier
  trusted_launch_enabled            = each.value.trusted_launch_enabled
  upload_size_bytes                 = each.value.upload_size_bytes
  zone                              = each.value.zone

  dynamic "encryption_settings" {
    for_each = each.value.encryption_settings != null ? each.value.encryption_settings : []
    content {

      dynamic "disk_encryption_key" {
        for_each = encryption_settings.value.disk_encryption_key != null ? encryption_settings.value.disk_encryption_key : []
        content {
          secret_url      = disk_encryption_key.value.secret_url
          source_vault_id = disk_encryption_key.value.source_vault_id
        }
      }

      dynamic "key_encryption_key" {
        for_each = encryption_settings.value.key_encryption_key != null ? encryption_settings.value.key_encryption_key : []
        content {
          key_url         = key_encryption_key.value.key_url
          source_vault_id = key_encryption_key.value.source_vault_id
        }
      }
    }
  }
}
