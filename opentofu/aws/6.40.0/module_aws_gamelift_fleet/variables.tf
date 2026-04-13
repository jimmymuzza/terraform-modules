variable "gamelift_fleets" {
  description = <<EOT
Map of gamelift_fleets, attributes below
Required:
    - ec2_instance_type
    - name
Optional:
    - build_id
    - description
    - fleet_type
    - instance_role_arn
    - metric_groups
    - new_game_session_protection_policy
    - region
    - script_id
    - tags
    - tags_all
    - certificate_configuration
    - ec2_inbound_permission
    - resource_creation_limit_policy
    - runtime_configuration
EOT

  type = map(object({
    ec2_instance_type                  = string
    name                               = string
    build_id                           = optional(string)
    description                        = optional(string)
    fleet_type                         = optional(string)
    instance_role_arn                  = optional(string)
    metric_groups                      = optional(list(string))
    new_game_session_protection_policy = optional(string)
    region                             = optional(string)
    script_id                          = optional(string)
    tags                               = optional(map(string))
    tags_all                           = optional(map(string))
    certificate_configuration          = optional(list(object({
            certificate_type = optional(string)
        })))
    ec2_inbound_permission             = optional(set(object({
            from_port = number
            ip_range  = string
            protocol  = string
            to_port   = number
        })))
    resource_creation_limit_policy     = optional(list(object({
            new_game_sessions_per_creator = optional(number)
            policy_period_in_minutes      = optional(number)
        })))
    runtime_configuration              = optional(list(object({
            game_session_activation_timeout_seconds = optional(number)
            max_concurrent_game_session_activations = optional(number)
            server_process                          = optional(list(object({
                concurrent_executions = number
                launch_path           = string
                parameters            = optional(string)
            })))
        })))
  }))
}
