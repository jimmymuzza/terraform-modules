variable "new_relic_tag_rules" {
  description = <<EOT
Map of new_relic_tag_rules, attributes below
Required:
    - monitor_id
Optional:
    - activity_log_enabled
    - azure_active_directory_log_enabled
    - metric_enabled
    - subscription_log_enabled
    - log_tag_filter
    - metric_tag_filter
EOT

  type = map(object({
    monitor_id                         = string
    activity_log_enabled               = optional(bool)
    azure_active_directory_log_enabled = optional(bool)
    metric_enabled                     = optional(bool)
    subscription_log_enabled           = optional(bool)
    log_tag_filter                     = optional(list(object({
            action = string
            name   = string
            value  = string
        })))
    metric_tag_filter                  = optional(list(object({
            action = string
            name   = string
            value  = string
        })))
  }))
}
