variable "cloudwatch_log_metric_filters" {
  description = <<EOT
Map of cloudwatch_log_metric_filters, attributes below
Required:
    - log_group_name
    - name
    - pattern
    - metric_transformation
Optional:
    - apply_on_transformed_logs
    - region
EOT

  type = map(object({
    log_group_name            = string
    name                      = string
    pattern                   = string
    apply_on_transformed_logs = optional(bool)
    region                    = optional(string)
    metric_transformation     = list(object({
            name          = string
            namespace     = string
            value         = string
            default_value = optional(string)
            dimensions    = optional(map(string))
            unit          = optional(string)
        }))
  }))
}
