variable "fsx_openzfs_file_systems" {
  description = <<EOT
Map of fsx_openzfs_file_systems, attributes below
Required:
    - deployment_type
    - subnet_ids
    - throughput_capacity
Optional:
    - automatic_backup_retention_days
    - backup_id
    - copy_tags_to_backups
    - copy_tags_to_volumes
    - daily_automatic_backup_start_time
    - delete_options
    - endpoint_ip_address_range
    - final_backup_tags
    - kms_key_id
    - network_type
    - preferred_subnet_id
    - region
    - route_table_ids
    - security_group_ids
    - skip_final_backup
    - storage_capacity
    - storage_type
    - tags
    - tags_all
    - weekly_maintenance_start_time
    - disk_iops_configuration
    - read_cache_configuration
    - root_volume_configuration
EOT

  type = map(object({
    deployment_type                   = string
    subnet_ids                        = list(string)
    throughput_capacity               = number
    automatic_backup_retention_days   = optional(number)
    backup_id                         = optional(string)
    copy_tags_to_backups              = optional(bool)
    copy_tags_to_volumes              = optional(bool)
    daily_automatic_backup_start_time = optional(string)
    delete_options                    = optional(set(string))
    endpoint_ip_address_range         = optional(string)
    final_backup_tags                 = optional(map(string))
    kms_key_id                        = optional(string)
    network_type                      = optional(string)
    preferred_subnet_id               = optional(string)
    region                            = optional(string)
    route_table_ids                   = optional(set(string))
    security_group_ids                = optional(set(string))
    skip_final_backup                 = optional(bool)
    storage_capacity                  = optional(number)
    storage_type                      = optional(string)
    tags                              = optional(map(string))
    tags_all                          = optional(map(string))
    weekly_maintenance_start_time     = optional(string)
    disk_iops_configuration           = optional(list(object({
            iops = optional(number)
            mode = optional(string)
        })))
    read_cache_configuration          = optional(list(object({
            size        = optional(number)
            sizing_mode = optional(string)
        })))
    root_volume_configuration         = optional(list(object({
            copy_tags_to_snapshots = optional(bool)
            data_compression_type  = optional(string)
            read_only              = optional(bool)
            record_size_kib        = optional(number)
            nfs_exports            = optional(list(object({
                client_configurations = set(object({
                    clients = string
                    options = list(string)
                }))
            })))
            user_and_group_quotas  = optional(set(object({
                storage_capacity_quota_gib = number
                type                       = string
            })))
        })))
  }))
}
