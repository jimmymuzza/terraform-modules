resource "aws_fsx_openzfs_volume" "fsx_openzfs_volumes" {
  for_each = var.fsx_openzfs_volumes

  name                             = each.value.name
  parent_volume_id                 = each.value.parent_volume_id
  copy_tags_to_snapshots           = each.value.copy_tags_to_snapshots
  data_compression_type            = each.value.data_compression_type
  delete_volume_options            = each.value.delete_volume_options
  read_only                        = each.value.read_only
  record_size_kib                  = each.value.record_size_kib
  region                           = each.value.region
  storage_capacity_quota_gib       = each.value.storage_capacity_quota_gib
  storage_capacity_reservation_gib = each.value.storage_capacity_reservation_gib
  tags                             = each.value.tags
  tags_all                         = each.value.tags_all
  volume_type                      = each.value.volume_type

  dynamic "nfs_exports" {
    for_each = each.value.nfs_exports != null ? each.value.nfs_exports : []
    content {

      dynamic "client_configurations" {
        for_each = nfs_exports.value.client_configurations != null ? nfs_exports.value.client_configurations : []
        content {
          clients = client_configurations.value.clients
          options = client_configurations.value.options
        }
      }
    }
  }

  dynamic "origin_snapshot" {
    for_each = each.value.origin_snapshot != null ? each.value.origin_snapshot : []
    content {
      copy_strategy = origin_snapshot.value.copy_strategy
      snapshot_arn  = origin_snapshot.value.snapshot_arn
    }
  }

  dynamic "user_and_group_quotas" {
    for_each = each.value.user_and_group_quotas != null ? each.value.user_and_group_quotas : []
    content {
      storage_capacity_quota_gib = user_and_group_quotas.value.storage_capacity_quota_gib
      type                       = user_and_group_quotas.value.type
    }
  }
}
