variable "data_protection_backup_policy_blob_storages" {
  description = <<EOT
Map of data_protection_backup_policy_blob_storages, attributes below
Required:
    - name
    - vault_id
Optional:
    - backup_repeating_time_intervals
    - operational_default_retention_duration
    - time_zone
    - vault_default_retention_duration
    - retention_rule
EOT

  type = map(object({
    name                                   = string
    vault_id                               = string
    backup_repeating_time_intervals        = optional(list(string))
    operational_default_retention_duration = optional(string)
    time_zone                              = optional(string)
    vault_default_retention_duration       = optional(string)
    retention_rule                         = optional(list(object({
            name       = string
            priority   = number
            criteria   = list(object({
                absolute_criteria      = optional(string)
                days_of_month          = optional(set(number))
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
