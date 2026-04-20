variable "backup_policy_vm_workloads" {
  description = <<EOT
Map of backup_policy_vm_workloads, attributes below
Required:
    - name
    - recovery_vault_name
    - resource_group_name
    - workload_type
    - protection_policy
    - settings
EOT

  type = map(object({
    name                = string
    recovery_vault_name = string
    resource_group_name = string
    workload_type       = string
    protection_policy   = set(object({
            policy_type       = string
            backup            = list(object({
                frequency            = optional(string)
                frequency_in_minutes = optional(number)
                time                 = optional(string)
                weekdays             = optional(set(string))
            }))
            retention_daily   = optional(list(object({
                count = number
            })))
            retention_monthly = optional(list(object({
                count       = number
                format_type = string
                monthdays   = optional(set(number))
                weekdays    = optional(set(string))
                weeks       = optional(set(string))
            })))
            retention_weekly  = optional(list(object({
                count    = number
                weekdays = set(string)
            })))
            retention_yearly  = optional(list(object({
                count       = number
                format_type = string
                months      = set(string)
                monthdays   = optional(set(number))
                weekdays    = optional(set(string))
                weeks       = optional(set(string))
            })))
            simple_retention  = optional(list(object({
                count = number
            })))
        }))
    settings            = list(object({
            time_zone           = string
            compression_enabled = optional(bool)
        }))
  }))
}
