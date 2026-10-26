variable "data_protection_backup_policy_cosmosdb_accounts" {
  description = <<EOT
Map of data_protection_backup_policy_cosmosdb_accounts, attributes below
Required:
    - backup_schedule
    - data_protection_backup_vault_id
    - default_retention_duration
    - name
Optional:
    - backup_frequency
    - monthly_retention_rule
    - weekly_retention_rule
    - yearly_retention_rule
EOT

  type = map(object({
    backup_schedule                 = string
    data_protection_backup_vault_id = string
    default_retention_duration      = string
    name                            = string
    backup_frequency                = optional(string)
    monthly_retention_rule          = optional(list(object({
            duration       = string
            days_of_week   = optional(set(string))
            weeks_of_month = optional(set(string))
        })))
    weekly_retention_rule           = optional(list(object({
            duration     = string
            days_of_week = optional(set(string))
        })))
    yearly_retention_rule           = optional(list(object({
            duration       = string
            days_of_week   = optional(set(string))
            months_of_year = optional(set(string))
            weeks_of_month = optional(set(string))
        })))
  }))
}
