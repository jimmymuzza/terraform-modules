variable "autoscaling_schedules" {
  description = <<EOT
Map of autoscaling_schedules, attributes below
Required:
    - autoscaling_group_name
    - scheduled_action_name
Optional:
    - desired_capacity
    - end_time
    - max_size
    - min_size
    - recurrence
    - region
    - start_time
    - time_zone
EOT

  type = map(object({
    autoscaling_group_name = string
    scheduled_action_name  = string
    desired_capacity       = optional(number)
    end_time               = optional(string)
    max_size               = optional(number)
    min_size               = optional(number)
    recurrence             = optional(string)
    region                 = optional(string)
    start_time             = optional(string)
    time_zone              = optional(string)
  }))
}
