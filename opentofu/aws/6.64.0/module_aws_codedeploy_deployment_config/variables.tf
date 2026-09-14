variable "codedeploy_deployment_configs" {
  description = <<EOT
Map of codedeploy_deployment_configs, attributes below
Required:
    - deployment_config_name
Optional:
    - compute_platform
    - region
    - minimum_healthy_hosts
    - traffic_routing_config
    - zonal_config
EOT

  type = map(object({
    deployment_config_name = string
    compute_platform       = optional(string)
    region                 = optional(string)
    minimum_healthy_hosts  = optional(list(object({
            type  = optional(string)
            value = optional(number)
        })))
    traffic_routing_config = optional(list(object({
            type              = optional(string)
            time_based_canary = optional(list(object({
                interval   = optional(number)
                percentage = optional(number)
            })))
            time_based_linear = optional(list(object({
                interval   = optional(number)
                percentage = optional(number)
            })))
        })))
    zonal_config           = optional(list(object({
            first_zone_monitor_duration_in_seconds = optional(number)
            monitor_duration_in_seconds            = optional(number)
            minimum_healthy_hosts_per_zone         = optional(list(object({
                type  = optional(string)
                value = optional(number)
            })))
        })))
  }))
}
