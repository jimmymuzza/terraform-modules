variable "virtual_desktop_scaling_plans" {
  description = <<EOT
Map of virtual_desktop_scaling_plans, attributes below
Required:
    - location
    - name
    - resource_group_name
    - time_zone
    - schedule
Optional:
    - description
    - exclusion_tag
    - friendly_name
    - tags
    - host_pool
EOT

  type = map(object({
    location            = string
    name                = string
    resource_group_name = string
    time_zone           = string
    description         = optional(string)
    exclusion_tag       = optional(string)
    friendly_name       = optional(string)
    tags                = optional(map(string))
    host_pool           = optional(list(object({
            hostpool_id          = string
            scaling_plan_enabled = bool
        })))
    schedule            = list(object({
            days_of_week                         = set(string)
            name                                 = string
            off_peak_load_balancing_algorithm    = string
            off_peak_start_time                  = string
            peak_load_balancing_algorithm        = string
            peak_start_time                      = string
            ramp_down_capacity_threshold_percent = number
            ramp_down_force_logoff_users         = bool
            ramp_down_load_balancing_algorithm   = string
            ramp_down_minimum_hosts_percent      = number
            ramp_down_notification_message       = string
            ramp_down_start_time                 = string
            ramp_down_stop_hosts_when            = string
            ramp_down_wait_time_minutes          = number
            ramp_up_load_balancing_algorithm     = string
            ramp_up_start_time                   = string
            ramp_up_capacity_threshold_percent   = optional(number)
            ramp_up_minimum_hosts_percent        = optional(number)
        }))
  }))
}
