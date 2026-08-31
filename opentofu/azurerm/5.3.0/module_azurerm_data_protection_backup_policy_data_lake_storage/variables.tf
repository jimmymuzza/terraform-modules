variable "data_protection_backup_policy_data_lake_storages" {
  description = <<EOT
Map of data_protection_backup_policy_data_lake_storages, attributes below
Required:
    - backup_schedule
    - data_protection_backup_vault_id
    - default_retention_duration
    - name
Optional:
    - time_zone
    - retention_rule
EOT

  type = map(object({
    backup_schedule                 = list(string)
    data_protection_backup_vault_id = string
    default_retention_duration      = string
    name                            = string
    time_zone                       = optional(string)
    retention_rule                  = optional(list(object({
            duration               = string
            name                   = string
            absolute_criteria      = optional(string)
            days_of_week           = optional(set(string))
            months_of_year         = optional(set(string))
            scheduled_backup_times = optional(set(string))
            weeks_of_month         = optional(set(string))
        })))
  }))
}
