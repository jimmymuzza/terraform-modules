variable "fsx_openzfs_volumes" {
  description = <<EOT
Map of fsx_openzfs_volumes, attributes below
Required:
    - name
    - parent_volume_id
Optional:
    - copy_tags_to_snapshots
    - data_compression_type
    - delete_volume_options
    - read_only
    - record_size_kib
    - region
    - storage_capacity_quota_gib
    - storage_capacity_reservation_gib
    - tags
    - tags_all
    - volume_type
    - nfs_exports
    - origin_snapshot
    - user_and_group_quotas
EOT

  type = map(object({
    name                             = string
    parent_volume_id                 = string
    copy_tags_to_snapshots           = optional(bool)
    data_compression_type            = optional(string)
    delete_volume_options            = optional(list(string))
    read_only                        = optional(bool)
    record_size_kib                  = optional(number)
    region                           = optional(string)
    storage_capacity_quota_gib       = optional(number)
    storage_capacity_reservation_gib = optional(number)
    tags                             = optional(map(string))
    tags_all                         = optional(map(string))
    volume_type                      = optional(string)
    nfs_exports                      = optional(list(object({
            client_configurations = set(object({
                clients = string
                options = list(string)
            }))
        })))
    origin_snapshot                  = optional(list(object({
            copy_strategy = string
            snapshot_arn  = string
        })))
    user_and_group_quotas            = optional(set(object({
            storage_capacity_quota_gib = number
            type                       = string
        })))
  }))
}
