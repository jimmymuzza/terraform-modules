variable "globalaccelerator_endpoint_groups" {
  description = <<EOT
Map of globalaccelerator_endpoint_groups, attributes below
Required:
    - listener_arn
Optional:
    - endpoint_group_region
    - health_check_interval_seconds
    - health_check_path
    - health_check_port
    - health_check_protocol
    - threshold_count
    - traffic_dial_percentage
    - endpoint_configuration
    - port_override
EOT

  type = map(object({
    listener_arn                  = string
    endpoint_group_region         = optional(string)
    health_check_interval_seconds = optional(number)
    health_check_path             = optional(string)
    health_check_port             = optional(number)
    health_check_protocol         = optional(string)
    threshold_count               = optional(number)
    traffic_dial_percentage       = optional(number)
    endpoint_configuration        = optional(set(object({
            attachment_arn                 = optional(string)
            client_ip_preservation_enabled = optional(bool)
            endpoint_id                    = optional(string)
            weight                         = optional(number)
        })))
    port_override                 = optional(set(object({
            endpoint_port = number
            listener_port = number
        })))
  }))
}
