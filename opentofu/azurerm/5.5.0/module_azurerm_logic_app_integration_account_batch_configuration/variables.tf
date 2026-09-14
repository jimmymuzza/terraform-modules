variable "logic_app_integration_account_batch_configurations" {
  description = <<EOT
Map of logic_app_integration_account_batch_configurations, attributes below
Required:
    - batch_group_name
    - integration_account_name
    - name
    - resource_group_name
    - release_criteria
Optional:
    - metadata
EOT

  type = map(object({
    batch_group_name         = string
    integration_account_name = string
    name                     = string
    resource_group_name      = string
    metadata                 = optional(map(string))
    release_criteria         = list(object({
            batch_size    = optional(number)
            message_count = optional(number)
            recurrence    = optional(list(object({
                frequency  = string
                interval   = number
                end_time   = optional(string)
                start_time = optional(string)
                time_zone  = optional(string)
                schedule   = optional(list(object({
                    hours      = optional(set(number))
                    minutes    = optional(set(number))
                    month_days = optional(set(number))
                    week_days  = optional(set(string))
                    monthly    = optional(set(object({
                        week    = number
                        weekday = string
                    })))
                })))
            })))
        }))
  }))
}
