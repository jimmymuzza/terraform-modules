variable "backup_policy_file_shares" {
  description = <<EOT
Map of backup_policy_file_shares, attributes below
Required:
    - name
    - recovery_vault_name
    - resource_group_name
    - backup
    - retention_daily
Optional:
    - backup_tier
    - snapshot_retention_in_days
    - timezone
    - retention_monthly
    - retention_weekly
    - retention_yearly
EOT

  type = map(object({
    name                       = string
    recovery_vault_name        = string
    resource_group_name        = string
    backup_tier                = optional(string)
    snapshot_retention_in_days = optional(number)
    timezone                   = optional(string)
    backup                     = list(object({
            frequency = string
            time      = optional(string)
            hourly    = optional(list(object({
                interval        = number
                start_time      = string
                window_duration = number
            })))
        }))
    retention_daily            = list(object({
            count = number
        }))
    retention_monthly          = optional(list(object({
            count             = number
            days              = optional(set(number))
            include_last_days = optional(bool)
            weekdays          = optional(set(string))
            weeks             = optional(set(string))
        })))
    retention_weekly           = optional(list(object({
            count    = number
            weekdays = set(string)
        })))
    retention_yearly           = optional(list(object({
            count             = number
            months            = set(string)
            days              = optional(set(number))
            include_last_days = optional(bool)
            weekdays          = optional(set(string))
            weeks             = optional(set(string))
        })))
  }))
}
