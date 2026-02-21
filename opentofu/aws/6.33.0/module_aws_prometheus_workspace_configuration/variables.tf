variable "prometheus_workspace_configurations" {
  description = <<EOT
Map of prometheus_workspace_configurations, attributes below
Required:
    - workspace_id
Optional:
    - region
    - retention_period_in_days
    - limits_per_label_set
EOT

  type = map(object({
    workspace_id             = string
    region                   = optional(string)
    retention_period_in_days = optional(number)
    limits_per_label_set     = optional(list(object({
            label_set = map(string)
            limits    = optional(list(object({
                max_series = number
            })))
        })))
  }))
}
