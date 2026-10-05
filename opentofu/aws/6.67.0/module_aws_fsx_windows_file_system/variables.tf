variable "fsx_windows_file_systems" {
  description = <<EOT
Map of fsx_windows_file_systems, attributes below
Required:
    - subnet_ids
    - throughput_capacity
Optional:
    - active_directory_id
    - aliases
    - automatic_backup_retention_days
    - backup_id
    - copy_tags_to_backups
    - daily_automatic_backup_start_time
    - deployment_type
    - final_backup_tags
    - kms_key_id
    - network_type
    - preferred_subnet_id
    - region
    - security_group_ids
    - skip_final_backup
    - storage_capacity
    - storage_type
    - tags
    - tags_all
    - weekly_maintenance_start_time
    - audit_log_configuration
    - disk_iops_configuration
    - self_managed_active_directory
EOT

  type = map(object({
    subnet_ids                        = list(string)
    throughput_capacity               = number
    active_directory_id               = optional(string)
    aliases                           = optional(set(string))
    automatic_backup_retention_days   = optional(number)
    backup_id                         = optional(string)
    copy_tags_to_backups              = optional(bool)
    daily_automatic_backup_start_time = optional(string)
    deployment_type                   = optional(string)
    final_backup_tags                 = optional(map(string))
    kms_key_id                        = optional(string)
    network_type                      = optional(string)
    preferred_subnet_id               = optional(string)
    region                            = optional(string)
    security_group_ids                = optional(set(string))
    skip_final_backup                 = optional(bool)
    storage_capacity                  = optional(number)
    storage_type                      = optional(string)
    tags                              = optional(map(string))
    tags_all                          = optional(map(string))
    weekly_maintenance_start_time     = optional(string)
    audit_log_configuration           = optional(list(object({
            audit_log_destination             = optional(string)
            file_access_audit_log_level       = optional(string)
            file_share_access_audit_log_level = optional(string)
        })))
    disk_iops_configuration           = optional(list(object({
            iops = optional(number)
            mode = optional(string)
        })))
    self_managed_active_directory     = optional(list(object({
            dns_ips                                = set(string)
            domain_name                            = string
            domain_join_service_account_secret     = optional(string)
            file_system_administrators_group       = optional(string)
            organizational_unit_distinguished_name = optional(string)
            password                               = optional(string)
            password_wo                            = optional(string)
            password_wo_version                    = optional(number)
            username                               = optional(string)
        })))
  }))
}
