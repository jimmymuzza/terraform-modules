variable "datadog_monitor_tag_rules" {
  description = <<EOT
Map of datadog_monitor_tag_rules, attributes below
Required:
    - datadog_monitor_id
Optional:
    - name
    - log
    - metric
EOT

  type = map(object({
    datadog_monitor_id = string
    name               = optional(string)
    log                = optional(list(object({
            aad_log_enabled          = optional(bool)
            resource_log_enabled     = optional(bool)
            subscription_log_enabled = optional(bool)
            filter                   = optional(list(object({
                action = string
                name   = string
                value  = string
            })))
        })))
    metric             = optional(list(object({
            filter = optional(list(object({
                action = string
                name   = string
                value  = string
            })))
        })))
  }))
}
