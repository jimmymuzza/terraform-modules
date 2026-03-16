variable "rds_cluster_instances" {
  description = <<EOT
Map of rds_cluster_instances, attributes below
Required:
    - cluster_identifier
    - engine
    - instance_class
Optional:
    - apply_immediately
    - auto_minor_version_upgrade
    - availability_zone
    - ca_cert_identifier
    - copy_tags_to_snapshot
    - custom_iam_instance_profile
    - db_parameter_group_name
    - db_subnet_group_name
    - engine_version
    - force_destroy
    - identifier
    - identifier_prefix
    - monitoring_interval
    - monitoring_role_arn
    - performance_insights_enabled
    - performance_insights_kms_key_id
    - performance_insights_retention_period
    - preferred_backup_window
    - preferred_maintenance_window
    - promotion_tier
    - publicly_accessible
    - region
    - tags
    - tags_all
EOT

  type = map(object({
    cluster_identifier                    = string
    engine                                = string
    instance_class                        = string
    apply_immediately                     = optional(bool)
    auto_minor_version_upgrade            = optional(bool)
    availability_zone                     = optional(string)
    ca_cert_identifier                    = optional(string)
    copy_tags_to_snapshot                 = optional(bool)
    custom_iam_instance_profile           = optional(string)
    db_parameter_group_name               = optional(string)
    db_subnet_group_name                  = optional(string)
    engine_version                        = optional(string)
    force_destroy                         = optional(bool)
    identifier                            = optional(string)
    identifier_prefix                     = optional(string)
    monitoring_interval                   = optional(number)
    monitoring_role_arn                   = optional(string)
    performance_insights_enabled          = optional(bool)
    performance_insights_kms_key_id       = optional(string)
    performance_insights_retention_period = optional(number)
    preferred_backup_window               = optional(string)
    preferred_maintenance_window          = optional(string)
    promotion_tier                        = optional(number)
    publicly_accessible                   = optional(bool)
    region                                = optional(string)
    tags                                  = optional(map(string))
    tags_all                              = optional(map(string))
  }))
}
