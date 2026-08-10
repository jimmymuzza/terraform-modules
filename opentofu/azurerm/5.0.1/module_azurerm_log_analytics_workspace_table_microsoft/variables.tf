variable "log_analytics_workspace_table_microsofts" {
  description = <<EOT
Map of log_analytics_workspace_table_microsofts, attributes below
Required:
    - name
    - workspace_id
Optional:
    - description
    - display_name
    - labels
    - retention_in_days
    - total_retention_in_days
    - column
EOT

  type = map(object({
    name                    = string
    workspace_id            = string
    description             = optional(string)
    display_name            = optional(string)
    labels                  = optional(set(string))
    retention_in_days       = optional(number)
    total_retention_in_days = optional(number)
    column                  = optional(list(object({
            name               = string
            type               = string
            description        = optional(string)
            display_by_default = optional(bool)
            display_name       = optional(string)
            hidden             = optional(bool)
        })))
  }))
}
