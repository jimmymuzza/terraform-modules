variable "ecs_express_gateway_services" {
  description = <<EOT
Map of ecs_express_gateway_services, attributes below
Required:
    - execution_role_arn
    - infrastructure_role_arn
Optional:
    - cluster
    - cpu
    - health_check_path
    - memory
    - network_configuration
    - region
    - scaling_target
    - service_name
    - tags
    - task_role_arn
    - wait_for_steady_state
    - primary_container
EOT

  type = map(object({
    execution_role_arn      = string
    infrastructure_role_arn = string
    cluster                 = optional(string)
    cpu                     = optional(string)
    health_check_path       = optional(string)
    memory                  = optional(string)
    network_configuration   = optional(list(object({
            security_groups = set(string)
            subnets = set(string)
        })))
    region                  = optional(string)
    scaling_target          = optional(list(object({
            auto_scaling_metric = string
            auto_scaling_target_value = number
            max_task_count = number
            min_task_count = number
        })))
    service_name            = optional(string)
    tags                    = optional(map(string))
    task_role_arn           = optional(string)
    wait_for_steady_state   = optional(bool)
    primary_container       = optional(list(object({
            image                  = string
            aws_logs_configuration = optional(list(object({
                log_group = string
                log_stream_prefix = string
            })))
            command                = optional(list(string))
            container_port         = optional(number)
            environment            = optional(list(object({
                name  = string
                value = string
            })))
            repository_credentials = optional(list(object({
                credentials_parameter = string
            })))
            secret                 = optional(list(object({
                name       = string
                value_from = string
            })))
        })))
  }))
}
