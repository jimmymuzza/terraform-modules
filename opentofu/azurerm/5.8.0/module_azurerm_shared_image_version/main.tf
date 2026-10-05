resource "azurerm_shared_image_version" "shared_image_versions" {
  for_each = var.shared_image_versions

  gallery_name                             = each.value.gallery_name
  image_name                               = each.value.image_name
  location                                 = each.value.location
  name                                     = each.value.name
  resource_group_name                      = each.value.resource_group_name
  blob_uri                                 = each.value.blob_uri
  deletion_of_replicated_locations_enabled = each.value.deletion_of_replicated_locations_enabled
  end_of_life_date                         = each.value.end_of_life_date
  exclude_from_latest                      = each.value.exclude_from_latest
  managed_image_id                         = each.value.managed_image_id
  os_disk_snapshot_id                      = each.value.os_disk_snapshot_id
  replication_mode                         = each.value.replication_mode
  storage_account_id                       = each.value.storage_account_id
  tags                                     = each.value.tags

  dynamic "target_region" {
    for_each = each.value.target_region != null ? each.value.target_region : []
    content {
      name                        = target_region.value.name
      regional_replica_count      = target_region.value.regional_replica_count
      disk_encryption_set_id      = target_region.value.disk_encryption_set_id
      exclude_from_latest_enabled = target_region.value.exclude_from_latest_enabled
      storage_account_type        = target_region.value.storage_account_type
    }
  }
}
