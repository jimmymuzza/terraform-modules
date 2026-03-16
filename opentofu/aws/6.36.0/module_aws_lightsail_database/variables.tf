variable "lightsail_databases" {
  description = <<EOT
Map of lightsail_databases, attributes below
Required:
    - blueprint_id
    - bundle_id
    - master_database_name
    - master_password
    - master_username
    - relational_database_name
Optional:
    - apply_immediately
    - availability_zone
    - backup_retention_enabled
    - final_snapshot_name
    - preferred_backup_window
    - preferred_maintenance_window
    - publicly_accessible
    - region
    - skip_final_snapshot
    - tags
    - tags_all
EOT

  type = map(object({
    blueprint_id                 = string
    bundle_id                    = string
    master_database_name         = string
    master_password              = string
    master_username              = string
    relational_database_name     = string
    apply_immediately            = optional(bool)
    availability_zone            = optional(string)
    backup_retention_enabled     = optional(bool)
    final_snapshot_name          = optional(string)
    preferred_backup_window      = optional(string)
    preferred_maintenance_window = optional(string)
    publicly_accessible          = optional(bool)
    region                       = optional(string)
    skip_final_snapshot          = optional(bool)
    tags                         = optional(map(string))
    tags_all                     = optional(map(string))
  }))
}
