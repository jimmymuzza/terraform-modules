variable "monitor_alert_processing_rule_suppressions" {
  description = <<EOT
Map of monitor_alert_processing_rule_suppressions, attributes below
Required:
    - name
    - resource_group_name
    - scopes
Optional:
    - description
    - enabled
    - tags
    - condition
    - schedule
EOT

  type = map(object({
    name                = string
    resource_group_name = string
    scopes              = list(string)
    description         = optional(string)
    enabled             = optional(bool)
    tags                = optional(map(string))
    condition           = optional(list(object({
            alert_context         = optional(list(object({
                operator = string
                values   = list(string)
            })))
            alert_rule_id         = optional(list(object({
                operator = string
                values   = list(string)
            })))
            alert_rule_name       = optional(list(object({
                operator = string
                values   = list(string)
            })))
            description           = optional(list(object({
                operator = string
                values   = list(string)
            })))
            monitor_condition     = optional(list(object({
                operator = string
                values   = list(string)
            })))
            monitor_service       = optional(list(object({
                operator = string
                values   = list(string)
            })))
            severity              = optional(list(object({
                operator = string
                values   = list(string)
            })))
            signal_type           = optional(list(object({
                operator = string
                values   = list(string)
            })))
            target_resource       = optional(list(object({
                operator = string
                values   = list(string)
            })))
            target_resource_group = optional(list(object({
                operator = string
                values   = list(string)
            })))
            target_resource_type  = optional(list(object({
                operator = string
                values   = list(string)
            })))
        })))
    schedule            = optional(list(object({
            effective_from  = optional(string)
            effective_until = optional(string)
            time_zone       = optional(string)
            recurrence      = optional(list(object({
                daily   = optional(list(object({
                    end_time   = string
                    start_time = string
                })))
                monthly = optional(list(object({
                    days_of_month = list(number)
                    end_time      = optional(string)
                    start_time    = optional(string)
                })))
                weekly  = optional(list(object({
                    days_of_week = list(string)
                    end_time     = optional(string)
                    start_time   = optional(string)
                })))
            })))
        })))
  }))
}
