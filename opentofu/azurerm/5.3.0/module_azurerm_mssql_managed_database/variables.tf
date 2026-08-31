variable "mssql_managed_databases" {
  description = <<EOT
Map of mssql_managed_databases, attributes below
Required:
    - managed_instance_id
    - name
Optional:
    - short_term_retention_days
    - tags
    - long_term_retention_policy
    - point_in_time_restore
EOT

  type = map(object({
    managed_instance_id        = string
    name                       = string
    short_term_retention_days  = optional(number)
    tags                       = optional(map(string))
    long_term_retention_policy = optional(list(object({
            monthly_retention = optional(string)
            week_of_year      = optional(number)
            weekly_retention  = optional(string)
            yearly_retention  = optional(string)
        })))
    point_in_time_restore      = optional(list(object({
            restore_point_in_time = string
            source_database_id    = string
        })))
  }))
}
