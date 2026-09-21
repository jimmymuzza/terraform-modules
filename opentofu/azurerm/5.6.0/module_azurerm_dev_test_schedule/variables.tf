variable "dev_test_schedules" {
  description = <<EOT
Map of dev_test_schedules, attributes below
Required:
    - lab_name
    - location
    - name
    - resource_group_name
    - task_type
    - time_zone_id
    - notification_settings
Optional:
    - status
    - tags
    - daily_recurrence
    - hourly_recurrence
    - weekly_recurrence
EOT

  type = map(object({
    lab_name              = string
    location              = string
    name                  = string
    resource_group_name   = string
    task_type             = string
    time_zone_id          = string
    status                = optional(string)
    tags                  = optional(map(string))
    daily_recurrence      = optional(list(object({
            time = string
        })))
    hourly_recurrence     = optional(list(object({
            minute = number
        })))
    notification_settings = list(object({
            status          = optional(string)
            time_in_minutes = optional(number)
            webhook_url     = optional(string)
        }))
    weekly_recurrence     = optional(list(object({
            time      = string
            week_days = optional(list(string))
        })))
  }))
}
