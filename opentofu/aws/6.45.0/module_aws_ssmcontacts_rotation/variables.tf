variable "ssmcontacts_rotations" {
  description = <<EOT
Map of ssmcontacts_rotations, attributes below
Required:
    - contact_ids
    - name
    - time_zone_id
Optional:
    - region
    - start_time
    - tags
    - recurrence
EOT

  type = map(object({
    contact_ids  = list(string)
    name         = string
    time_zone_id = string
    region       = optional(string)
    start_time   = optional(string)
    tags         = optional(map(string))
    recurrence   = optional(list(object({
            number_of_on_calls    = number
            recurrence_multiplier = number
            daily_settings        = optional(list(object({
                hour_of_day    = number
                minute_of_hour = number
            })))
            monthly_settings      = optional(list(object({
                day_of_month  = number
                hand_off_time = optional(list(object({
                    hour_of_day    = number
                    minute_of_hour = number
                })))
            })))
            shift_coverages       = optional(list(object({
                map_block_key  = string
                coverage_times = optional(list(object({
                    end   = optional(list(object({
                        hour_of_day    = number
                        minute_of_hour = number
                    })))
                    start = optional(list(object({
                        hour_of_day    = number
                        minute_of_hour = number
                    })))
                })))
            })))
            weekly_settings       = optional(list(object({
                day_of_week   = string
                hand_off_time = optional(list(object({
                    hour_of_day    = number
                    minute_of_hour = number
                })))
            })))
        })))
  }))
}
