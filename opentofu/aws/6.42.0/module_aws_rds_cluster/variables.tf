variable "rds_clusters" {
  description = <<EOT
Map of rds_clusters, attributes below
Required:
    - engine
Optional:
    - allocated_storage
    - allow_major_version_upgrade
    - apply_immediately
    - availability_zones
    - backtrack_window
    - backup_retention_period
    - ca_certificate_identifier
    - cluster_identifier
    - cluster_identifier_prefix
    - cluster_members
    - cluster_scalability_type
    - copy_tags_to_snapshot
    - database_insights_mode
    - database_name
    - db_cluster_instance_class
    - db_cluster_parameter_group_name
    - db_instance_parameter_group_name
    - db_subnet_group_name
    - db_system_id
    - delete_automated_backups
    - deletion_protection
    - domain
    - domain_iam_role_name
    - enable_global_write_forwarding
    - enable_http_endpoint
    - enable_local_write_forwarding
    - enabled_cloudwatch_logs_exports
    - engine_lifecycle_support
    - engine_mode
    - engine_version
    - final_snapshot_identifier
    - global_cluster_identifier
    - iam_database_authentication_enabled
    - iam_roles
    - iops
    - kms_key_id
    - manage_master_user_password
    - master_password
    - master_password_wo
    - master_password_wo_version
    - master_user_secret_kms_key_id
    - master_username
    - monitoring_interval
    - monitoring_role_arn
    - network_type
    - performance_insights_enabled
    - performance_insights_kms_key_id
    - performance_insights_retention_period
    - port
    - preferred_backup_window
    - preferred_maintenance_window
    - region
    - replication_source_identifier
    - skip_final_snapshot
    - snapshot_identifier
    - source_region
    - storage_encrypted
    - storage_type
    - tags
    - tags_all
    - vpc_security_group_ids
    - restore_to_point_in_time
    - s3_import
    - scaling_configuration
    - serverlessv2_scaling_configuration
EOT

  type = map(object({
    engine                                = string
    allocated_storage                     = optional(number)
    allow_major_version_upgrade           = optional(bool)
    apply_immediately                     = optional(bool)
    availability_zones                    = optional(set(string))
    backtrack_window                      = optional(number)
    backup_retention_period               = optional(number)
    ca_certificate_identifier             = optional(string)
    cluster_identifier                    = optional(string)
    cluster_identifier_prefix             = optional(string)
    cluster_members                       = optional(set(string))
    cluster_scalability_type              = optional(string)
    copy_tags_to_snapshot                 = optional(bool)
    database_insights_mode                = optional(string)
    database_name                         = optional(string)
    db_cluster_instance_class             = optional(string)
    db_cluster_parameter_group_name       = optional(string)
    db_instance_parameter_group_name      = optional(string)
    db_subnet_group_name                  = optional(string)
    db_system_id                          = optional(string)
    delete_automated_backups              = optional(bool)
    deletion_protection                   = optional(bool)
    domain                                = optional(string)
    domain_iam_role_name                  = optional(string)
    enable_global_write_forwarding        = optional(bool)
    enable_http_endpoint                  = optional(bool)
    enable_local_write_forwarding         = optional(bool)
    enabled_cloudwatch_logs_exports       = optional(set(string))
    engine_lifecycle_support              = optional(string)
    engine_mode                           = optional(string)
    engine_version                        = optional(string)
    final_snapshot_identifier             = optional(string)
    global_cluster_identifier             = optional(string)
    iam_database_authentication_enabled   = optional(bool)
    iam_roles                             = optional(set(string))
    iops                                  = optional(number)
    kms_key_id                            = optional(string)
    manage_master_user_password           = optional(bool)
    master_password                       = optional(string)
    master_password_wo                    = optional(string)
    master_password_wo_version            = optional(number)
    master_user_secret_kms_key_id         = optional(string)
    master_username                       = optional(string)
    monitoring_interval                   = optional(number)
    monitoring_role_arn                   = optional(string)
    network_type                          = optional(string)
    performance_insights_enabled          = optional(bool)
    performance_insights_kms_key_id       = optional(string)
    performance_insights_retention_period = optional(number)
    port                                  = optional(number)
    preferred_backup_window               = optional(string)
    preferred_maintenance_window          = optional(string)
    region                                = optional(string)
    replication_source_identifier         = optional(string)
    skip_final_snapshot                   = optional(bool)
    snapshot_identifier                   = optional(string)
    source_region                         = optional(string)
    storage_encrypted                     = optional(bool)
    storage_type                          = optional(string)
    tags                                  = optional(map(string))
    tags_all                              = optional(map(string))
    vpc_security_group_ids                = optional(set(string))
    restore_to_point_in_time              = optional(list(object({
            restore_to_time            = optional(string)
            restore_type               = optional(string)
            source_cluster_identifier  = optional(string)
            source_cluster_resource_id = optional(string)
            use_latest_restorable_time = optional(bool)
        })))
    s3_import                             = optional(list(object({
            bucket_name           = string
            ingestion_role        = string
            source_engine         = string
            source_engine_version = string
            bucket_prefix         = optional(string)
        })))
    scaling_configuration                 = optional(list(object({
            auto_pause               = optional(bool)
            max_capacity             = optional(number)
            min_capacity             = optional(number)
            seconds_before_timeout   = optional(number)
            seconds_until_auto_pause = optional(number)
            timeout_action           = optional(string)
        })))
    serverlessv2_scaling_configuration    = optional(list(object({
            max_capacity             = number
            min_capacity             = number
            seconds_until_auto_pause = optional(number)
        })))
  }))
}
