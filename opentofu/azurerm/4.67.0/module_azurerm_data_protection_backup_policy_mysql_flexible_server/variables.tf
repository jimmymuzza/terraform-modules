variable "data_protection_backup_policy_mysql_flexible_servers" {
  description = <<EOT
Map of data_protection_backup_policy_mysql_flexible_servers, attributes below
Required:
    - backup_repeating_time_intervals
    - name
    - vault_id
    - default_retention_rule
Optional:
    - time_zone
    - retention_rule
EOT

  type = map(object({
    backup_repeating_time_intervals = list(string)
    name                            = string
    vault_id                        = string
    time_zone                       = optional(string)
    default_retention_rule          = list(object({
            life_cycle = list(object({
                data_store_type = string
                duration        = string
            }))
        }))
    retention_rule                  = optional(list(object({
            name       = string
            priority   = number
            criteria   = list(object({
                absolute_criteria      = optional(string)
                days_of_week           = optional(set(string))
                months_of_year         = optional(set(string))
                scheduled_backup_times = optional(set(string))
                weeks_of_month         = optional(set(string))
            }))
            life_cycle = list(object({
                data_store_type = string
                duration        = string
            }))
        })))
  }))
}
