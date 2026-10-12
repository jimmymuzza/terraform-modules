resource "aws_ssm_maintenance_window_task" "ssm_maintenance_window_tasks" {
  for_each = var.ssm_maintenance_window_tasks

  task_arn         = each.value.task_arn
  task_type        = each.value.task_type
  window_id        = each.value.window_id
  cutoff_behavior  = each.value.cutoff_behavior
  description      = each.value.description
  max_concurrency  = each.value.max_concurrency
  max_errors       = each.value.max_errors
  name             = each.value.name
  priority         = each.value.priority
  region           = each.value.region
  service_role_arn = each.value.service_role_arn

  dynamic "targets" {
    for_each = each.value.targets != null ? each.value.targets : []
    content {
      key    = targets.value.key
      values = targets.value.values
    }
  }

  dynamic "task_invocation_parameters" {
    for_each = each.value.task_invocation_parameters != null ? each.value.task_invocation_parameters : []
    content {

      dynamic "automation_parameters" {
        for_each = task_invocation_parameters.value.automation_parameters != null ? task_invocation_parameters.value.automation_parameters : []
        content {
          document_version = automation_parameters.value.document_version

          dynamic "parameter" {
            for_each = automation_parameters.value.parameter != null ? automation_parameters.value.parameter : []
            content {
              name   = parameter.value.name
              values = parameter.value.values
            }
          }
        }
      }

      dynamic "lambda_parameters" {
        for_each = task_invocation_parameters.value.lambda_parameters != null ? task_invocation_parameters.value.lambda_parameters : []
        content {
          client_context = lambda_parameters.value.client_context
          payload        = lambda_parameters.value.payload
          qualifier      = lambda_parameters.value.qualifier
        }
      }

      dynamic "run_command_parameters" {
        for_each = task_invocation_parameters.value.run_command_parameters != null ? task_invocation_parameters.value.run_command_parameters : []
        content {
          comment              = run_command_parameters.value.comment
          document_hash        = run_command_parameters.value.document_hash
          document_hash_type   = run_command_parameters.value.document_hash_type
          document_version     = run_command_parameters.value.document_version
          output_s3_bucket     = run_command_parameters.value.output_s3_bucket
          output_s3_key_prefix = run_command_parameters.value.output_s3_key_prefix
          service_role_arn     = run_command_parameters.value.service_role_arn
          timeout_seconds      = run_command_parameters.value.timeout_seconds

          dynamic "cloudwatch_config" {
            for_each = run_command_parameters.value.cloudwatch_config != null ? run_command_parameters.value.cloudwatch_config : []
            content {
              cloudwatch_log_group_name = cloudwatch_config.value.cloudwatch_log_group_name
              cloudwatch_output_enabled = cloudwatch_config.value.cloudwatch_output_enabled
            }
          }

          dynamic "notification_config" {
            for_each = run_command_parameters.value.notification_config != null ? run_command_parameters.value.notification_config : []
            content {
              notification_arn    = notification_config.value.notification_arn
              notification_events = notification_config.value.notification_events
              notification_type   = notification_config.value.notification_type
            }
          }

          dynamic "parameter" {
            for_each = run_command_parameters.value.parameter != null ? run_command_parameters.value.parameter : []
            content {
              name   = parameter.value.name
              values = parameter.value.values
            }
          }
        }
      }

      dynamic "step_functions_parameters" {
        for_each = task_invocation_parameters.value.step_functions_parameters != null ? task_invocation_parameters.value.step_functions_parameters : []
        content {
          input = step_functions_parameters.value.input
          name  = step_functions_parameters.value.name
        }
      }
    }
  }
}
