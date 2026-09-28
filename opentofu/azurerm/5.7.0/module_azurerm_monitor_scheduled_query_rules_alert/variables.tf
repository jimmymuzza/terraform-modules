variable "monitor_scheduled_query_rules_alerts" {
  description = <<EOT
Map of monitor_scheduled_query_rules_alerts, attributes below
Required:
    - data_source_id
    - frequency
    - location
    - name
    - query
    - resource_group_name
    - time_window
    - action
    - trigger
Optional:
    - authorized_resource_ids
    - auto_mitigation_enabled
    - description
    - enabled
    - query_type
    - severity
    - tags
    - throttling
EOT

  type = map(object({
    data_source_id          = string
    frequency               = number
    location                = string
    name                    = string
    query                   = string
    resource_group_name     = string
    time_window             = number
    authorized_resource_ids = optional(set(string))
    auto_mitigation_enabled = optional(bool)
    description             = optional(string)
    enabled                 = optional(bool)
    query_type              = optional(string)
    severity                = optional(number)
    tags                    = optional(map(string))
    throttling              = optional(number)
    action                  = list(object({
            action_group           = set(string)
            custom_webhook_payload = optional(string)
            email_subject          = optional(string)
        }))
    trigger                 = list(object({
            operator       = string
            threshold      = number
            metric_trigger = optional(list(object({
                metric_trigger_type = string
                operator            = string
                threshold           = number
                metric_column       = optional(string)
            })))
        }))
  }))
}
