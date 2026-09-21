variable "log_analytics_workspace_tables" {
  description = <<EOT
Map of log_analytics_workspace_tables, attributes below
Required:
    - name
    - workspace_id
Optional:
    - plan
    - retention_in_days
    - total_retention_in_days
EOT

  type = map(object({
    name                    = string
    workspace_id            = string
    plan                    = optional(string)
    retention_in_days       = optional(number)
    total_retention_in_days = optional(number)
  }))
}
