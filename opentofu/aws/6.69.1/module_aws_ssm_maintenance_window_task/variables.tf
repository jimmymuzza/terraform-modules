variable "ssm_maintenance_window_tasks" {
  description = <<EOT
Map of ssm_maintenance_window_tasks, attributes below
Required:
    - task_arn
    - task_type
    - window_id
Optional:
    - cutoff_behavior
    - description
    - max_concurrency
    - max_errors
    - name
    - priority
    - region
    - service_role_arn
    - targets
    - task_invocation_parameters
EOT

  type = map(object({
    task_arn                   = string
    task_type                  = string
    window_id                  = string
    cutoff_behavior            = optional(string)
    description                = optional(string)
    max_concurrency            = optional(string)
    max_errors                 = optional(string)
    name                       = optional(string)
    priority                   = optional(number)
    region                     = optional(string)
    service_role_arn           = optional(string)
    targets                    = optional(list(object({
            key    = string
            values = list(string)
        })))
    task_invocation_parameters = optional(list(object({
            automation_parameters     = optional(list(object({
                document_version = optional(string)
                parameter        = optional(set(object({
                    name   = string
                    values = list(string)
                })))
            })))
            lambda_parameters         = optional(list(object({
                client_context = optional(string)
                payload        = optional(string)
                qualifier      = optional(string)
            })))
            run_command_parameters    = optional(list(object({
                comment              = optional(string)
                document_hash        = optional(string)
                document_hash_type   = optional(string)
                document_version     = optional(string)
                output_s3_bucket     = optional(string)
                output_s3_key_prefix = optional(string)
                service_role_arn     = optional(string)
                timeout_seconds      = optional(number)
                cloudwatch_config    = optional(list(object({
                    cloudwatch_log_group_name = optional(string)
                    cloudwatch_output_enabled = optional(bool)
                })))
                notification_config  = optional(list(object({
                    notification_arn    = optional(string)
                    notification_events = optional(list(string))
                    notification_type   = optional(string)
                })))
                parameter            = optional(set(object({
                    name   = string
                    values = list(string)
                })))
            })))
            step_functions_parameters = optional(list(object({
                input = optional(string)
                name  = optional(string)
            })))
        })))
  }))
}
