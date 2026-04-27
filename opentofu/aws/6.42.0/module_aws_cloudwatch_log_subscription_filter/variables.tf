variable "cloudwatch_log_subscription_filters" {
  description = <<EOT
Map of cloudwatch_log_subscription_filters, attributes below
Required:
    - destination_arn
    - filter_pattern
    - log_group_name
    - name
Optional:
    - apply_on_transformed_logs
    - distribution
    - emit_system_fields
    - region
    - role_arn
EOT

  type = map(object({
    destination_arn           = string
    filter_pattern            = string
    log_group_name            = string
    name                      = string
    apply_on_transformed_logs = optional(bool)
    distribution              = optional(string)
    emit_system_fields        = optional(set(string))
    region                    = optional(string)
    role_arn                  = optional(string)
  }))
}
