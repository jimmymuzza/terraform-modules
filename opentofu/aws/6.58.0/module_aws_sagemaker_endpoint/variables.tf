variable "sagemaker_endpoints" {
  description = <<EOT
Map of sagemaker_endpoints, attributes below
Required:
    - endpoint_config_name
Optional:
    - name
    - region
    - tags
    - tags_all
    - deployment_config
EOT

  type = map(object({
    endpoint_config_name = string
    name                 = optional(string)
    region               = optional(string)
    tags                 = optional(map(string))
    tags_all             = optional(map(string))
    deployment_config    = optional(list(object({
            auto_rollback_configuration = optional(list(object({
                alarms = optional(set(object({
                    alarm_name = string
                })))
            })))
            blue_green_update_policy    = optional(list(object({
                maximum_execution_timeout_in_seconds = optional(number)
                termination_wait_in_seconds          = optional(number)
                traffic_routing_configuration        = list(object({
                    type                     = string
                    wait_interval_in_seconds = number
                    canary_size              = optional(list(object({
                        type  = string
                        value = number
                    })))
                    linear_step_size         = optional(list(object({
                        type  = string
                        value = number
                    })))
                }))
            })))
            rolling_update_policy       = optional(list(object({
                wait_interval_in_seconds             = number
                maximum_execution_timeout_in_seconds = optional(number)
                maximum_batch_size                   = list(object({
                    type  = string
                    value = number
                }))
                rollback_maximum_batch_size          = optional(list(object({
                    type  = string
                    value = number
                })))
            })))
        })))
  }))
}
