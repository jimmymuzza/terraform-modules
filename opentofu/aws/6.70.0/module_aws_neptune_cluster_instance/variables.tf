variable "neptune_cluster_instances" {
  description = <<EOT
Map of neptune_cluster_instances, attributes below
Required:
    - cluster_identifier
    - instance_class
Optional:
    - apply_immediately
    - auto_minor_version_upgrade
    - availability_zone
    - engine
    - engine_version
    - identifier
    - identifier_prefix
    - neptune_parameter_group_name
    - neptune_subnet_group_name
    - port
    - preferred_backup_window
    - preferred_maintenance_window
    - promotion_tier
    - publicly_accessible
    - region
    - skip_final_snapshot
    - tags
    - tags_all
EOT

  type = map(object({
    cluster_identifier           = string
    instance_class               = string
    apply_immediately            = optional(bool)
    auto_minor_version_upgrade   = optional(bool)
    availability_zone            = optional(string)
    engine                       = optional(string)
    engine_version               = optional(string)
    identifier                   = optional(string)
    identifier_prefix            = optional(string)
    neptune_parameter_group_name = optional(string)
    neptune_subnet_group_name    = optional(string)
    port                         = optional(number)
    preferred_backup_window      = optional(string)
    preferred_maintenance_window = optional(string)
    promotion_tier               = optional(number)
    publicly_accessible          = optional(bool)
    region                       = optional(string)
    skip_final_snapshot          = optional(bool)
    tags                         = optional(map(string))
    tags_all                     = optional(map(string))
  }))
}
