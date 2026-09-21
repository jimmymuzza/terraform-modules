variable "cloudwatch_composite_alarms" {
  description = <<EOT
Map of cloudwatch_composite_alarms, attributes below
Required:
    - alarm_name
    - alarm_rule
Optional:
    - actions_enabled
    - alarm_actions
    - alarm_description
    - insufficient_data_actions
    - ok_actions
    - region
    - tags
    - tags_all
    - actions_suppressor
EOT

  type = map(object({
    alarm_name                = string
    alarm_rule                = string
    actions_enabled           = optional(bool)
    alarm_actions             = optional(set(string))
    alarm_description         = optional(string)
    insufficient_data_actions = optional(set(string))
    ok_actions                = optional(set(string))
    region                    = optional(string)
    tags                      = optional(map(string))
    tags_all                  = optional(map(string))
    actions_suppressor        = optional(list(object({
            alarm            = string
            extension_period = number
            wait_period      = number
        })))
  }))
}
