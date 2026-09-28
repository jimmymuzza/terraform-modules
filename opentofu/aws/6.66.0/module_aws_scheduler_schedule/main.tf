resource "aws_scheduler_schedule" "scheduler_schedules" {
  for_each = var.scheduler_schedules

  schedule_expression          = each.value.schedule_expression
  action_after_completion      = each.value.action_after_completion
  description                  = each.value.description
  end_date                     = each.value.end_date
  group_name                   = each.value.group_name
  kms_key_arn                  = each.value.kms_key_arn
  name                         = each.value.name
  name_prefix                  = each.value.name_prefix
  region                       = each.value.region
  schedule_expression_timezone = each.value.schedule_expression_timezone
  start_date                   = each.value.start_date
  state                        = each.value.state

  dynamic "flexible_time_window" {
    for_each = each.value.flexible_time_window != null ? each.value.flexible_time_window : []
    content {
      mode                      = flexible_time_window.value.mode
      maximum_window_in_minutes = flexible_time_window.value.maximum_window_in_minutes
    }
  }

  dynamic "target" {
    for_each = each.value.target != null ? each.value.target : []
    content {
      arn      = target.value.arn
      role_arn = target.value.role_arn
      input    = target.value.input

      dynamic "dead_letter_config" {
        for_each = target.value.dead_letter_config != null ? target.value.dead_letter_config : []
        content {
          arn = dead_letter_config.value.arn
        }
      }

      dynamic "ecs_parameters" {
        for_each = target.value.ecs_parameters != null ? target.value.ecs_parameters : []
        content {
          task_definition_arn     = ecs_parameters.value.task_definition_arn
          enable_ecs_managed_tags = ecs_parameters.value.enable_ecs_managed_tags
          enable_execute_command  = ecs_parameters.value.enable_execute_command
          group                   = ecs_parameters.value.group
          launch_type             = ecs_parameters.value.launch_type
          platform_version        = ecs_parameters.value.platform_version
          propagate_tags          = ecs_parameters.value.propagate_tags
          reference_id            = ecs_parameters.value.reference_id
          tags                    = ecs_parameters.value.tags
          task_count              = ecs_parameters.value.task_count

          dynamic "capacity_provider_strategy" {
            for_each = ecs_parameters.value.capacity_provider_strategy != null ? ecs_parameters.value.capacity_provider_strategy : []
            content {
              capacity_provider = capacity_provider_strategy.value.capacity_provider
              base              = capacity_provider_strategy.value.base
              weight            = capacity_provider_strategy.value.weight
            }
          }

          dynamic "network_configuration" {
            for_each = ecs_parameters.value.network_configuration != null ? ecs_parameters.value.network_configuration : []
            content {
              subnets          = network_configuration.value.subnets
              assign_public_ip = network_configuration.value.assign_public_ip
              security_groups  = network_configuration.value.security_groups
            }
          }

          dynamic "placement_constraints" {
            for_each = ecs_parameters.value.placement_constraints != null ? ecs_parameters.value.placement_constraints : []
            content {
              type       = placement_constraints.value.type
              expression = placement_constraints.value.expression
            }
          }

          dynamic "placement_strategy" {
            for_each = ecs_parameters.value.placement_strategy != null ? ecs_parameters.value.placement_strategy : []
            content {
              type  = placement_strategy.value.type
              field = placement_strategy.value.field
            }
          }
        }
      }

      dynamic "eventbridge_parameters" {
        for_each = target.value.eventbridge_parameters != null ? target.value.eventbridge_parameters : []
        content {
          detail_type = eventbridge_parameters.value.detail_type
          source      = eventbridge_parameters.value.source
        }
      }

      dynamic "kinesis_parameters" {
        for_each = target.value.kinesis_parameters != null ? target.value.kinesis_parameters : []
        content {
          partition_key = kinesis_parameters.value.partition_key
        }
      }

      dynamic "retry_policy" {
        for_each = target.value.retry_policy != null ? target.value.retry_policy : []
        content {
          maximum_event_age_in_seconds = retry_policy.value.maximum_event_age_in_seconds
          maximum_retry_attempts       = retry_policy.value.maximum_retry_attempts
        }
      }

      dynamic "sagemaker_pipeline_parameters" {
        for_each = target.value.sagemaker_pipeline_parameters != null ? target.value.sagemaker_pipeline_parameters : []
        content {

          dynamic "pipeline_parameter" {
            for_each = sagemaker_pipeline_parameters.value.pipeline_parameter != null ? sagemaker_pipeline_parameters.value.pipeline_parameter : []
            content {
              name  = pipeline_parameter.value.name
              value = pipeline_parameter.value.value
            }
          }
        }
      }

      dynamic "sqs_parameters" {
        for_each = target.value.sqs_parameters != null ? target.value.sqs_parameters : []
        content {
          message_group_id = sqs_parameters.value.message_group_id
        }
      }
    }
  }
}
