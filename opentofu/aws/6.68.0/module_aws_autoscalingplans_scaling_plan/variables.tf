variable "autoscalingplans_scaling_plans" {
  description = <<EOT
Map of autoscalingplans_scaling_plans, attributes below
Required:
    - name
    - application_source
    - scaling_instruction
Optional:
    - region
EOT

  type = map(object({
    name                = string
    region              = optional(string)
    application_source  = list(object({
            cloudformation_stack_arn = optional(string)
            tag_filter               = optional(set(object({
                key    = string
                values = optional(set(string))
            })))
        }))
    scaling_instruction = set(object({
            max_capacity                             = number
            min_capacity                             = number
            resource_id                              = string
            scalable_dimension                       = string
            service_namespace                        = string
            disable_dynamic_scaling                  = optional(bool)
            predictive_scaling_max_capacity_behavior = optional(string)
            predictive_scaling_max_capacity_buffer   = optional(number)
            predictive_scaling_mode                  = optional(string)
            scaling_policy_update_behavior           = optional(string)
            scheduled_action_buffer_time             = optional(number)
            customized_load_metric_specification     = optional(list(object({
                metric_name = string
                namespace   = string
                statistic   = string
                dimensions  = optional(map(string))
                unit        = optional(string)
            })))
            predefined_load_metric_specification     = optional(list(object({
                predefined_load_metric_type = string
                resource_label              = optional(string)
            })))
            target_tracking_configuration            = set(object({
                target_value                            = number
                disable_scale_in                        = optional(bool)
                estimated_instance_warmup               = optional(number)
                scale_in_cooldown                       = optional(number)
                scale_out_cooldown                      = optional(number)
                customized_scaling_metric_specification = optional(list(object({
                    metric_name = string
                    namespace   = string
                    statistic   = string
                    dimensions  = optional(map(string))
                    unit        = optional(string)
                })))
                predefined_scaling_metric_specification = optional(list(object({
                    predefined_scaling_metric_type = string
                    resource_label                 = optional(string)
                })))
            }))
        }))
  }))
}
