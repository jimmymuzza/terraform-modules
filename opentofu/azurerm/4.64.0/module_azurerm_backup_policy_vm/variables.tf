variable "backup_policy_vms" {
  description = <<EOT
Map of backup_policy_vms, attributes below
Required:
    - name
    - recovery_vault_name
    - resource_group_name
    - backup
Optional:
    - instant_restore_retention_days
    - policy_type
    - timezone
    - instant_restore_resource_group
    - retention_daily
    - retention_monthly
    - retention_weekly
    - retention_yearly
    - tiering_policy
EOT

  type = map(object({
    name                           = string
    recovery_vault_name            = string
    resource_group_name            = string
    instant_restore_retention_days = optional(number)
    policy_type                    = optional(string)
    timezone                       = optional(string)
    backup                         = list(object({
            frequency     = string
            time          = string
            hour_duration = optional(number)
            hour_interval = optional(number)
            weekdays      = optional(set(string))
        }))
    instant_restore_resource_group = optional(list(object({
            prefix = string
            suffix = optional(string)
        })))
    retention_daily                = optional(list(object({
            count = number
        })))
    retention_monthly              = optional(list(object({
            count             = number
            days              = optional(set(number))
            include_last_days = optional(bool)
            weekdays          = optional(set(string))
            weeks             = optional(set(string))
        })))
    retention_weekly               = optional(list(object({
            count    = number
            weekdays = set(string)
        })))
    retention_yearly               = optional(list(object({
            count             = number
            months            = set(string)
            days              = optional(set(number))
            include_last_days = optional(bool)
            weekdays          = optional(set(string))
            weeks             = optional(set(string))
        })))
    tiering_policy                 = optional(list(object({
            archived_restore_point = list(object({
                mode          = string
                duration      = optional(number)
                duration_type = optional(string)
            }))
        })))
  }))
}
