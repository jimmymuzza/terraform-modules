variable "automation_schedules" {
  description = <<EOT
Map of automation_schedules, attributes below
Required:
    - automation_account_name
    - frequency
    - name
    - resource_group_name
Optional:
    - description
    - expiry_time
    - interval
    - month_days
    - start_time
    - timezone
    - week_days
    - monthly_occurrence
EOT

  type = map(object({
    automation_account_name = string
    frequency               = string
    name                    = string
    resource_group_name     = string
    description             = optional(string)
    expiry_time             = optional(string)
    interval                = optional(number)
    month_days              = optional(set(number))
    start_time              = optional(string)
    timezone                = optional(string)
    week_days               = optional(set(string))
    monthly_occurrence      = optional(list(object({
            day        = string
            occurrence = number
        })))
  }))
}
