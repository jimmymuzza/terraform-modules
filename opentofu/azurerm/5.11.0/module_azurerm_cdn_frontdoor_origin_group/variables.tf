variable "cdn_frontdoor_origin_groups" {
  description = <<EOT
Map of cdn_frontdoor_origin_groups, attributes below
Required:
    - cdn_frontdoor_profile_id
    - name
    - load_balancing
Optional:
    - restore_traffic_time_to_healed_or_new_endpoint_in_minutes
    - session_affinity_enabled
    - health_probe
EOT

  type = map(object({
    cdn_frontdoor_profile_id                                  = string
    name                                                      = string
    restore_traffic_time_to_healed_or_new_endpoint_in_minutes = optional(number)
    session_affinity_enabled                                  = optional(bool)
    health_probe                                              = optional(list(object({
            interval_in_seconds = number
            protocol            = string
            path                = optional(string)
            request_type        = optional(string)
        })))
    load_balancing                                            = list(object({
            additional_latency_in_milliseconds = optional(number)
            sample_size                        = optional(number)
            successful_samples_required        = optional(number)
        }))
  }))
}
