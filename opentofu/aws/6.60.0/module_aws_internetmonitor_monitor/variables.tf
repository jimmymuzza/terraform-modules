variable "internetmonitor_monitors" {
  description = <<EOT
Map of internetmonitor_monitors, attributes below
Required:
    - monitor_name
Optional:
    - max_city_networks_to_monitor
    - region
    - resources
    - status
    - tags
    - tags_all
    - traffic_percentage_to_monitor
    - health_events_config
    - internet_measurements_log_delivery
EOT

  type = map(object({
    monitor_name                       = string
    max_city_networks_to_monitor       = optional(number)
    region                             = optional(string)
    resources                          = optional(set(string))
    status                             = optional(string)
    tags                               = optional(map(string))
    tags_all                           = optional(map(string))
    traffic_percentage_to_monitor      = optional(number)
    health_events_config               = optional(list(object({
            availability_score_threshold = optional(number)
            performance_score_threshold  = optional(number)
        })))
    internet_measurements_log_delivery = optional(list(object({
            s3_config = optional(list(object({
                bucket_name         = string
                bucket_prefix       = optional(string)
                log_delivery_status = optional(string)
            })))
        })))
  }))
}
