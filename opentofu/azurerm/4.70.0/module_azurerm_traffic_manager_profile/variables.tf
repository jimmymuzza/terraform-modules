variable "traffic_manager_profiles" {
  description = <<EOT
Map of traffic_manager_profiles, attributes below
Required:
    - name
    - resource_group_name
    - traffic_routing_method
    - dns_config
    - monitor_config
Optional:
    - max_return
    - profile_status
    - tags
    - traffic_view_enabled
EOT

  type = map(object({
    name                   = string
    resource_group_name    = string
    traffic_routing_method = string
    max_return             = optional(number)
    profile_status         = optional(string)
    tags                   = optional(map(string))
    traffic_view_enabled   = optional(bool)
    dns_config             = list(object({
            relative_name = string
            ttl           = number
        }))
    monitor_config         = list(object({
            port                         = number
            protocol                     = string
            expected_status_code_ranges  = optional(list(string))
            interval_in_seconds          = optional(number)
            path                         = optional(string)
            timeout_in_seconds           = optional(number)
            tolerated_number_of_failures = optional(number)
            custom_header                = optional(list(object({
                name  = string
                value = string
            })))
        }))
  }))
}
