variable "dynatrace_tag_rules" {
  description = <<EOT
Map of dynatrace_tag_rules, attributes below
Required:
    - monitor_id
    - name
Optional:
    - log_rule
    - metric_rule
EOT

  type = map(object({
    monitor_id  = string
    name        = string
    log_rule    = optional(list(object({
            send_activity_logs_enabled               = optional(bool)
            send_azure_active_directory_logs_enabled = optional(bool)
            send_subscription_logs_enabled           = optional(bool)
            filtering_tag                            = optional(list(object({
                action = string
                name   = string
                value  = string
            })))
        })))
    metric_rule = optional(list(object({
            sending_metrics_enabled = optional(bool)
            filtering_tag           = optional(list(object({
                action = string
                name   = string
                value  = string
            })))
        })))
  }))
}
