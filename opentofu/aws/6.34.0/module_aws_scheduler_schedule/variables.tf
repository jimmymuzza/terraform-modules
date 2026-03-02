variable "scheduler_schedules" {
  description = <<EOT
Map of scheduler_schedules, attributes below
Required:
    - schedule_expression
    - flexible_time_window
    - target
Optional:
    - action_after_completion
    - description
    - end_date
    - group_name
    - kms_key_arn
    - name
    - name_prefix
    - region
    - schedule_expression_timezone
    - start_date
    - state
EOT

  type = map(object({
    schedule_expression          = string
    action_after_completion      = optional(string)
    description                  = optional(string)
    end_date                     = optional(string)
    group_name                   = optional(string)
    kms_key_arn                  = optional(string)
    name                         = optional(string)
    name_prefix                  = optional(string)
    region                       = optional(string)
    schedule_expression_timezone = optional(string)
    start_date                   = optional(string)
    state                        = optional(string)
    flexible_time_window         = list(object({
            mode                      = string
            maximum_window_in_minutes = optional(number)
        }))
    target                       = list(object({
            arn                           = string
            role_arn                      = string
            input                         = optional(string)
            dead_letter_config            = optional(list(object({
                arn = string
            })))
            ecs_parameters                = optional(list(object({
                task_definition_arn        = string
                enable_ecs_managed_tags    = optional(bool)
                enable_execute_command     = optional(bool)
                group                      = optional(string)
                launch_type                = optional(string)
                platform_version           = optional(string)
                propagate_tags             = optional(string)
                reference_id               = optional(string)
                tags                       = optional(map(string))
                task_count                 = optional(number)
                capacity_provider_strategy = optional(set(object({
                    capacity_provider = string
                    base              = optional(number)
                    weight            = optional(number)
                })))
                network_configuration      = optional(list(object({
                    subnets          = set(string)
                    assign_public_ip = optional(bool)
                    security_groups  = optional(set(string))
                })))
                placement_constraints      = optional(set(object({
                    type       = string
                    expression = optional(string)
                })))
                placement_strategy         = optional(set(object({
                    type  = string
                    field = optional(string)
                })))
            })))
            eventbridge_parameters        = optional(list(object({
                detail_type = string
                source      = string
            })))
            kinesis_parameters            = optional(list(object({
                partition_key = string
            })))
            retry_policy                  = optional(list(object({
                maximum_event_age_in_seconds = optional(number)
                maximum_retry_attempts       = optional(number)
            })))
            sagemaker_pipeline_parameters = optional(list(object({
                pipeline_parameter = optional(set(object({
                    name  = string
                    value = string
                })))
            })))
            sqs_parameters                = optional(list(object({
                message_group_id = optional(string)
            })))
        }))
  }))
}
