variable "neptune_clusters" {
  description = <<EOT
Map of neptune_clusters, attributes below
Optional:
    - allow_major_version_upgrade
    - apply_immediately
    - availability_zones
    - backup_retention_period
    - cluster_identifier
    - cluster_identifier_prefix
    - copy_tags_to_snapshot
    - deletion_protection
    - enable_cloudwatch_logs_exports
    - engine
    - engine_version
    - final_snapshot_identifier
    - global_cluster_identifier
    - iam_database_authentication_enabled
    - iam_roles
    - kms_key_arn
    - neptune_cluster_parameter_group_name
    - neptune_instance_parameter_group_name
    - neptune_subnet_group_name
    - port
    - preferred_backup_window
    - preferred_maintenance_window
    - region
    - replication_source_identifier
    - skip_final_snapshot
    - snapshot_identifier
    - storage_encrypted
    - storage_type
    - tags
    - tags_all
    - vpc_security_group_ids
    - serverless_v2_scaling_configuration
EOT

  type = map(object({
    allow_major_version_upgrade           = optional(bool)
    apply_immediately                     = optional(bool)
    availability_zones                    = optional(set(string))
    backup_retention_period               = optional(number)
    cluster_identifier                    = optional(string)
    cluster_identifier_prefix             = optional(string)
    copy_tags_to_snapshot                 = optional(bool)
    deletion_protection                   = optional(bool)
    enable_cloudwatch_logs_exports        = optional(set(string))
    engine                                = optional(string)
    engine_version                        = optional(string)
    final_snapshot_identifier             = optional(string)
    global_cluster_identifier             = optional(string)
    iam_database_authentication_enabled   = optional(bool)
    iam_roles                             = optional(set(string))
    kms_key_arn                           = optional(string)
    neptune_cluster_parameter_group_name  = optional(string)
    neptune_instance_parameter_group_name = optional(string)
    neptune_subnet_group_name             = optional(string)
    port                                  = optional(number)
    preferred_backup_window               = optional(string)
    preferred_maintenance_window          = optional(string)
    region                                = optional(string)
    replication_source_identifier         = optional(string)
    skip_final_snapshot                   = optional(bool)
    snapshot_identifier                   = optional(string)
    storage_encrypted                     = optional(bool)
    storage_type                          = optional(string)
    tags                                  = optional(map(string))
    tags_all                              = optional(map(string))
    vpc_security_group_ids                = optional(set(string))
    serverless_v2_scaling_configuration   = optional(list(object({
            max_capacity = optional(number)
            min_capacity = optional(number)
        })))
  }))
}
