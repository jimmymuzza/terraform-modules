variable "automanage_configurations" {
  description = <<EOT
Map of automanage_configurations, attributes below
Required:
    - location
    - name
    - resource_group_name
Optional:
    - automation_account_enabled
    - boot_diagnostics_enabled
    - defender_for_cloud_enabled
    - guest_configuration_enabled
    - log_analytics_enabled
    - status_change_alert_enabled
    - tags
    - antimalware
    - azure_security_baseline
    - backup
EOT

  type = map(object({
    location                    = string
    name                        = string
    resource_group_name         = string
    automation_account_enabled  = optional(bool)
    boot_diagnostics_enabled    = optional(bool)
    defender_for_cloud_enabled  = optional(bool)
    guest_configuration_enabled = optional(bool)
    log_analytics_enabled       = optional(bool)
    status_change_alert_enabled = optional(bool)
    tags                        = optional(map(string))
    antimalware                 = optional(list(object({
            real_time_protection_enabled   = optional(bool)
            scheduled_scan_day             = optional(number)
            scheduled_scan_enabled         = optional(bool)
            scheduled_scan_time_in_minutes = optional(number)
            scheduled_scan_type            = optional(string)
            exclusions                     = optional(list(object({
                extensions = optional(string)
                paths      = optional(string)
                processes  = optional(string)
            })))
        })))
    azure_security_baseline     = optional(list(object({
            assignment_type = optional(string)
        })))
    backup                      = optional(list(object({
            instant_rp_retention_range_in_days = optional(number)
            policy_name                        = optional(string)
            time_zone                          = optional(string)
            retention_policy                   = optional(list(object({
                retention_policy_type = optional(string)
                daily_schedule        = optional(list(object({
                    retention_times    = optional(list(string))
                    retention_duration = optional(list(object({
                        count         = optional(number)
                        duration_type = optional(string)
                    })))
                })))
                weekly_schedule       = optional(list(object({
                    retention_times    = optional(list(string))
                    retention_duration = optional(list(object({
                        count         = optional(number)
                        duration_type = optional(string)
                    })))
                })))
            })))
            schedule_policy                    = optional(list(object({
                schedule_policy_type   = optional(string)
                schedule_run_days      = optional(list(string))
                schedule_run_frequency = optional(string)
                schedule_run_times     = optional(list(string))
            })))
        })))
  }))
}
