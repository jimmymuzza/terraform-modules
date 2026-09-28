variable "backup_plans" {
  description = <<EOT
Map of backup_plans, attributes below
Required:
    - name
    - rule
Optional:
    - region
    - tags
    - tags_all
    - advanced_backup_setting
    - scan_setting
EOT

  type = map(object({
    name                    = string
    region                  = optional(string)
    tags                    = optional(map(string))
    tags_all                = optional(map(string))
    advanced_backup_setting = optional(set(object({
            backup_options = map(string)
            resource_type  = string
        })))
    rule                    = set(object({
            rule_name                                    = string
            target_vault_name                            = string
            completion_window                            = optional(number)
            enable_continuous_backup                     = optional(bool)
            recovery_point_tags                          = optional(map(string))
            schedule                                     = optional(string)
            schedule_expression_timezone                 = optional(string)
            start_window                                 = optional(number)
            target_logically_air_gapped_backup_vault_arn = optional(string)
            copy_action                                  = optional(set(object({
                destination_vault_arn = string
                lifecycle             = optional(list(object({
                    cold_storage_after                        = optional(number)
                    delete_after                              = optional(number)
                    opt_in_to_archive_for_supported_resources = optional(bool)
                })))
            })))
            lifecycle                                    = optional(list(object({
                cold_storage_after                        = optional(number)
                delete_after                              = optional(number)
                opt_in_to_archive_for_supported_resources = optional(bool)
            })))
            scan_action                                  = optional(set(object({
                malware_scanner = string
                scan_mode       = string
            })))
        }))
    scan_setting            = optional(set(object({
            malware_scanner  = string
            resource_types   = set(string)
            scanner_role_arn = string
        })))
  }))
}
