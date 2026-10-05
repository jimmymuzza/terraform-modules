variable "prometheus_workspace_configurations" {
  description = <<EOT
Map of prometheus_workspace_configurations, attributes below
Required:
    - workspace_id
Optional:
    - out_of_order_time_window_in_seconds
    - region
    - retention_period_in_days
    - rule_query_offset_in_seconds
    - limits_per_label_set
EOT

  type = map(object({
    workspace_id                        = string
    out_of_order_time_window_in_seconds = optional(number)
    region                              = optional(string)
    retention_period_in_days            = optional(number)
    rule_query_offset_in_seconds        = optional(number)
    limits_per_label_set                = optional(list(object({
            label_set = map(string)
            limits    = optional(list(object({
                max_series = number
            })))
        })))
  }))
}
