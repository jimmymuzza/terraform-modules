variable "lb_target_groups" {
  description = <<EOT
Map of lb_target_groups, attributes below
Optional:
    - connection_termination
    - deregistration_delay
    - ip_address_type
    - lambda_multi_value_headers_enabled
    - load_balancing_algorithm_type
    - load_balancing_anomaly_mitigation
    - load_balancing_cross_zone_enabled
    - name
    - name_prefix
    - port
    - preserve_client_ip
    - protocol
    - protocol_version
    - proxy_protocol_v2
    - region
    - slow_start
    - tags
    - tags_all
    - target_control_port
    - target_type
    - vpc_id
    - health_check
    - stickiness
    - target_failover
    - target_group_health
    - target_health_state
EOT

  type = map(object({
    connection_termination             = optional(bool)
    deregistration_delay               = optional(string)
    ip_address_type                    = optional(string)
    lambda_multi_value_headers_enabled = optional(bool)
    load_balancing_algorithm_type      = optional(string)
    load_balancing_anomaly_mitigation  = optional(string)
    load_balancing_cross_zone_enabled  = optional(string)
    name                               = optional(string)
    name_prefix                        = optional(string)
    port                               = optional(number)
    preserve_client_ip                 = optional(string)
    protocol                           = optional(string)
    protocol_version                   = optional(string)
    proxy_protocol_v2                  = optional(bool)
    region                             = optional(string)
    slow_start                         = optional(number)
    tags                               = optional(map(string))
    tags_all                           = optional(map(string))
    target_control_port                = optional(number)
    target_type                        = optional(string)
    vpc_id                             = optional(string)
    health_check                       = optional(list(object({
            enabled             = optional(bool)
            healthy_threshold   = optional(number)
            interval            = optional(number)
            matcher             = optional(string)
            path                = optional(string)
            port                = optional(string)
            protocol            = optional(string)
            timeout             = optional(number)
            unhealthy_threshold = optional(number)
        })))
    stickiness                         = optional(list(object({
            type            = string
            cookie_duration = optional(number)
            cookie_name     = optional(string)
            enabled         = optional(bool)
        })))
    target_failover                    = optional(list(object({
            on_deregistration = string
            on_unhealthy      = string
        })))
    target_group_health                = optional(list(object({
            dns_failover            = optional(list(object({
                minimum_healthy_targets_count      = optional(string)
                minimum_healthy_targets_percentage = optional(string)
            })))
            unhealthy_state_routing = optional(list(object({
                minimum_healthy_targets_count      = optional(number)
                minimum_healthy_targets_percentage = optional(string)
            })))
        })))
    target_health_state                = optional(list(object({
            enable_unhealthy_connection_termination = bool
            unhealthy_draining_interval             = optional(number)
        })))
  }))
}
