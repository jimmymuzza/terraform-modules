variable "fsx_lustre_file_systems" {
  description = <<EOT
Map of fsx_lustre_file_systems, attributes below
Required:
    - subnet_ids
Optional:
    - auto_import_policy
    - automatic_backup_retention_days
    - backup_id
    - copy_tags_to_backups
    - daily_automatic_backup_start_time
    - data_compression_type
    - deployment_type
    - drive_cache_type
    - efa_enabled
    - export_path
    - file_system_type_version
    - final_backup_tags
    - import_path
    - imported_file_chunk_size
    - kms_key_id
    - per_unit_storage_throughput
    - region
    - security_group_ids
    - skip_final_backup
    - storage_capacity
    - storage_type
    - tags
    - tags_all
    - throughput_capacity
    - weekly_maintenance_start_time
    - data_read_cache_configuration
    - log_configuration
    - metadata_configuration
    - root_squash_configuration
EOT

  type = map(object({
    subnet_ids                        = list(string)
    auto_import_policy                = optional(string)
    automatic_backup_retention_days   = optional(number)
    backup_id                         = optional(string)
    copy_tags_to_backups              = optional(bool)
    daily_automatic_backup_start_time = optional(string)
    data_compression_type             = optional(string)
    deployment_type                   = optional(string)
    drive_cache_type                  = optional(string)
    efa_enabled                       = optional(bool)
    export_path                       = optional(string)
    file_system_type_version          = optional(string)
    final_backup_tags                 = optional(map(string))
    import_path                       = optional(string)
    imported_file_chunk_size          = optional(number)
    kms_key_id                        = optional(string)
    per_unit_storage_throughput       = optional(number)
    region                            = optional(string)
    security_group_ids                = optional(set(string))
    skip_final_backup                 = optional(bool)
    storage_capacity                  = optional(number)
    storage_type                      = optional(string)
    tags                              = optional(map(string))
    tags_all                          = optional(map(string))
    throughput_capacity               = optional(number)
    weekly_maintenance_start_time     = optional(string)
    data_read_cache_configuration     = optional(list(object({
            sizing_mode = string
            size        = optional(number)
        })))
    log_configuration                 = optional(list(object({
            destination = optional(string)
            level       = optional(string)
        })))
    metadata_configuration            = optional(list(object({
            iops = optional(number)
            mode = optional(string)
        })))
    root_squash_configuration         = optional(list(object({
            no_squash_nids = optional(set(string))
            root_squash    = optional(string)
        })))
  }))
}
