variable "docdb_clusters" {
  description = <<EOT
Map of docdb_clusters, attributes below
Optional:
    - allow_major_version_upgrade
    - apply_immediately
    - availability_zones
    - backup_retention_period
    - cluster_identifier
    - cluster_identifier_prefix
    - cluster_members
    - db_cluster_parameter_group_name
    - db_subnet_group_name
    - deletion_protection
    - enabled_cloudwatch_logs_exports
    - engine
    - engine_version
    - final_snapshot_identifier
    - global_cluster_identifier
    - kms_key_id
    - manage_master_user_password
    - master_password
    - master_password_wo
    - master_password_wo_version
    - master_username
    - network_type
    - port
    - preferred_backup_window
    - preferred_maintenance_window
    - region
    - skip_final_snapshot
    - snapshot_identifier
    - storage_encrypted
    - storage_type
    - tags
    - tags_all
    - vpc_security_group_ids
    - restore_to_point_in_time
    - serverless_v2_scaling_configuration
EOT

  type = map(object({
    allow_major_version_upgrade         = optional(bool)
    apply_immediately                   = optional(bool)
    availability_zones                  = optional(set(string))
    backup_retention_period             = optional(number)
    cluster_identifier                  = optional(string)
    cluster_identifier_prefix           = optional(string)
    cluster_members                     = optional(set(string))
    db_cluster_parameter_group_name     = optional(string)
    db_subnet_group_name                = optional(string)
    deletion_protection                 = optional(bool)
    enabled_cloudwatch_logs_exports     = optional(list(string))
    engine                              = optional(string)
    engine_version                      = optional(string)
    final_snapshot_identifier           = optional(string)
    global_cluster_identifier           = optional(string)
    kms_key_id                          = optional(string)
    manage_master_user_password         = optional(bool)
    master_password                     = optional(string)
    master_password_wo                  = optional(string)
    master_password_wo_version          = optional(number)
    master_username                     = optional(string)
    network_type                        = optional(string)
    port                                = optional(number)
    preferred_backup_window             = optional(string)
    preferred_maintenance_window        = optional(string)
    region                              = optional(string)
    skip_final_snapshot                 = optional(bool)
    snapshot_identifier                 = optional(string)
    storage_encrypted                   = optional(bool)
    storage_type                        = optional(string)
    tags                                = optional(map(string))
    tags_all                            = optional(map(string))
    vpc_security_group_ids              = optional(set(string))
    restore_to_point_in_time            = optional(list(object({
            source_cluster_identifier  = string
            restore_to_time            = optional(string)
            restore_type               = optional(string)
            use_latest_restorable_time = optional(bool)
        })))
    serverless_v2_scaling_configuration = optional(list(object({
            max_capacity = number
            min_capacity = number
        })))
  }))
}
