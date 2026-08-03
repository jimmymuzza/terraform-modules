variable "db_instances" {
  description = <<EOT
Map of db_instances, attributes below
Required:
    - instance_class
Optional:
    - allocated_storage
    - allow_major_version_upgrade
    - apply_immediately
    - auto_minor_version_upgrade
    - availability_zone
    - backup_retention_period
    - backup_target
    - backup_window
    - ca_cert_identifier
    - character_set_name
    - copy_tags_to_snapshot
    - custom_iam_instance_profile
    - customer_owned_ip_enabled
    - database_insights_mode
    - db_name
    - db_subnet_group_name
    - dedicated_log_volume
    - delete_automated_backups
    - deletion_protection
    - domain
    - domain_auth_secret_arn
    - domain_dns_ips
    - domain_fqdn
    - domain_iam_role_name
    - domain_ou
    - enabled_cloudwatch_logs_exports
    - engine
    - engine_lifecycle_support
    - engine_version
    - final_snapshot_identifier
    - iam_database_authentication_enabled
    - identifier
    - identifier_prefix
    - iops
    - kms_key_id
    - license_model
    - maintenance_window
    - manage_master_user_password
    - master_user_secret_kms_key_id
    - max_allocated_storage
    - monitoring_interval
    - monitoring_role_arn
    - multi_az
    - nchar_character_set_name
    - network_type
    - option_group_name
    - parameter_group_name
    - password
    - password_wo
    - password_wo_version
    - performance_insights_enabled
    - performance_insights_kms_key_id
    - performance_insights_retention_period
    - port
    - publicly_accessible
    - region
    - replica_mode
    - replicate_source_db
    - skip_final_snapshot
    - snapshot_identifier
    - storage_encrypted
    - storage_throughput
    - storage_type
    - tags
    - tags_all
    - timezone
    - upgrade_storage_config
    - username
    - vpc_security_group_ids
    - blue_green_update
    - restore_to_point_in_time
    - s3_import
EOT

  type = map(object({
    instance_class                        = string
    allocated_storage                     = optional(number)
    allow_major_version_upgrade           = optional(bool)
    apply_immediately                     = optional(bool)
    auto_minor_version_upgrade            = optional(bool)
    availability_zone                     = optional(string)
    backup_retention_period               = optional(number)
    backup_target                         = optional(string)
    backup_window                         = optional(string)
    ca_cert_identifier                    = optional(string)
    character_set_name                    = optional(string)
    copy_tags_to_snapshot                 = optional(bool)
    custom_iam_instance_profile           = optional(string)
    customer_owned_ip_enabled             = optional(bool)
    database_insights_mode                = optional(string)
    db_name                               = optional(string)
    db_subnet_group_name                  = optional(string)
    dedicated_log_volume                  = optional(bool)
    delete_automated_backups              = optional(bool)
    deletion_protection                   = optional(bool)
    domain                                = optional(string)
    domain_auth_secret_arn                = optional(string)
    domain_dns_ips                        = optional(list(string))
    domain_fqdn                           = optional(string)
    domain_iam_role_name                  = optional(string)
    domain_ou                             = optional(string)
    enabled_cloudwatch_logs_exports       = optional(set(string))
    engine                                = optional(string)
    engine_lifecycle_support              = optional(string)
    engine_version                        = optional(string)
    final_snapshot_identifier             = optional(string)
    iam_database_authentication_enabled   = optional(bool)
    identifier                            = optional(string)
    identifier_prefix                     = optional(string)
    iops                                  = optional(number)
    kms_key_id                            = optional(string)
    license_model                         = optional(string)
    maintenance_window                    = optional(string)
    manage_master_user_password           = optional(bool)
    master_user_secret_kms_key_id         = optional(string)
    max_allocated_storage                 = optional(number)
    monitoring_interval                   = optional(number)
    monitoring_role_arn                   = optional(string)
    multi_az                              = optional(bool)
    nchar_character_set_name              = optional(string)
    network_type                          = optional(string)
    option_group_name                     = optional(string)
    parameter_group_name                  = optional(string)
    password                              = optional(string)
    password_wo                           = optional(string)
    password_wo_version                   = optional(number)
    performance_insights_enabled          = optional(bool)
    performance_insights_kms_key_id       = optional(string)
    performance_insights_retention_period = optional(number)
    port                                  = optional(number)
    publicly_accessible                   = optional(bool)
    region                                = optional(string)
    replica_mode                          = optional(string)
    replicate_source_db                   = optional(string)
    skip_final_snapshot                   = optional(bool)
    snapshot_identifier                   = optional(string)
    storage_encrypted                     = optional(bool)
    storage_throughput                    = optional(number)
    storage_type                          = optional(string)
    tags                                  = optional(map(string))
    tags_all                              = optional(map(string))
    timezone                              = optional(string)
    upgrade_storage_config                = optional(bool)
    username                              = optional(string)
    vpc_security_group_ids                = optional(set(string))
    blue_green_update                     = optional(list(object({
            enabled = optional(bool)
        })))
    restore_to_point_in_time              = optional(list(object({
            restore_time                             = optional(string)
            source_db_instance_automated_backups_arn = optional(string)
            source_db_instance_identifier            = optional(string)
            source_dbi_resource_id                   = optional(string)
            use_latest_restorable_time               = optional(bool)
        })))
    s3_import                             = optional(list(object({
            bucket_name           = string
            ingestion_role        = string
            source_engine         = string
            source_engine_version = string
            bucket_prefix         = optional(string)
        })))
  }))
}
