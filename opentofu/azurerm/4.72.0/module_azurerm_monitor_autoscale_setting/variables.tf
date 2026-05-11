variable "monitor_autoscale_settings" {
  description = <<EOT
Map of monitor_autoscale_settings, attributes below
Required:
    - location
    - name
    - resource_group_name
    - target_resource_id
    - profile
Optional:
    - enabled
    - tags
    - notification
    - predictive
EOT

  type = map(object({
    location            = string
    name                = string
    resource_group_name = string
    target_resource_id  = string
    enabled             = optional(bool)
    tags                = optional(map(string))
    notification        = optional(list(object({
            email   = optional(list(object({
                custom_emails                         = optional(list(string))
                send_to_subscription_administrator    = optional(bool)
                send_to_subscription_co_administrator = optional(bool)
            })))
            webhook = optional(list(object({
                service_uri = string
                properties  = optional(map(string))
            })))
        })))
    predictive          = optional(list(object({
            scale_mode      = string
            look_ahead_time = optional(string)
        })))
    profile             = list(object({
            name       = string
            capacity   = list(object({
                default = number
                maximum = number
                minimum = number
            }))
            fixed_date = optional(list(object({
                end      = string
                start    = string
                timezone = optional(string)
            })))
            recurrence = optional(list(object({
                days     = list(string)
                hours    = list(number)
                minutes  = list(number)
                timezone = optional(string)
            })))
            rule       = optional(list(object({
                metric_trigger = list(object({
                    metric_name              = string
                    metric_resource_id       = string
                    operator                 = string
                    statistic                = string
                    threshold                = number
                    time_aggregation         = string
                    time_grain               = string
                    time_window              = string
                    divide_by_instance_count = optional(bool)
                    metric_namespace         = optional(string)
                    dimensions               = optional(list(object({
                        name     = string
                        operator = string
                        values   = list(string)
                    })))
                }))
                scale_action   = list(object({
                    cooldown  = string
                    direction = string
                    type      = string
                    value     = number
                }))
            })))
        }))
  }))
}
