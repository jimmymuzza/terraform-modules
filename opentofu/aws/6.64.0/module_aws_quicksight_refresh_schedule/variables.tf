variable "quicksight_refresh_schedules" {
  description = <<EOT
Map of quicksight_refresh_schedules, attributes below
Required:
    - data_set_id
    - schedule_id
Optional:
    - aws_account_id
    - region
    - schedule
EOT

  type = map(object({
    data_set_id    = string
    schedule_id    = string
    aws_account_id = optional(string)
    region         = optional(string)
    schedule       = optional(list(object({
            refresh_type          = string
            start_after_date_time = optional(string)
            schedule_frequency    = optional(list(object({
                interval        = string
                time_of_the_day = optional(string)
                timezone        = optional(string)
                refresh_on_day  = optional(list(object({
                    day_of_month = optional(string)
                    day_of_week  = optional(string)
                })))
            })))
        })))
  }))
}
