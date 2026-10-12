variable "docdb_cluster_instances" {
  description = <<EOT
Map of docdb_cluster_instances, attributes below
Required:
    - cluster_identifier
    - instance_class
Optional:
    - apply_immediately
    - auto_minor_version_upgrade
    - availability_zone
    - ca_cert_identifier
    - certificate_rotation_restart
    - copy_tags_to_snapshot
    - enable_performance_insights
    - engine
    - identifier
    - identifier_prefix
    - performance_insights_kms_key_id
    - preferred_maintenance_window
    - promotion_tier
    - region
    - tags
    - tags_all
EOT

  type = map(object({
    cluster_identifier              = string
    instance_class                  = string
    apply_immediately               = optional(bool)
    auto_minor_version_upgrade      = optional(bool)
    availability_zone               = optional(string)
    ca_cert_identifier              = optional(string)
    certificate_rotation_restart    = optional(string)
    copy_tags_to_snapshot           = optional(bool)
    enable_performance_insights     = optional(bool)
    engine                          = optional(string)
    identifier                      = optional(string)
    identifier_prefix               = optional(string)
    performance_insights_kms_key_id = optional(string)
    preferred_maintenance_window    = optional(string)
    promotion_tier                  = optional(number)
    region                          = optional(string)
    tags                            = optional(map(string))
    tags_all                        = optional(map(string))
  }))
}
