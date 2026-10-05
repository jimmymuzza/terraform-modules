variable "glue_jobs" {
  description = <<EOT
Map of glue_jobs, attributes below
Required:
    - name
    - role_arn
    - command
Optional:
    - connections
    - default_arguments
    - description
    - execution_class
    - glue_version
    - job_mode
    - job_run_queuing_enabled
    - maintenance_window
    - max_capacity
    - max_retries
    - non_overridable_arguments
    - number_of_workers
    - region
    - security_configuration
    - tags
    - tags_all
    - timeout
    - worker_type
    - execution_property
    - notification_property
    - source_control_details
EOT

  type = map(object({
    name                      = string
    role_arn                  = string
    connections               = optional(list(string))
    default_arguments         = optional(map(string))
    description               = optional(string)
    execution_class           = optional(string)
    glue_version              = optional(string)
    job_mode                  = optional(string)
    job_run_queuing_enabled   = optional(bool)
    maintenance_window        = optional(string)
    max_capacity              = optional(number)
    max_retries               = optional(number)
    non_overridable_arguments = optional(map(string))
    number_of_workers         = optional(number)
    region                    = optional(string)
    security_configuration    = optional(string)
    tags                      = optional(map(string))
    tags_all                  = optional(map(string))
    timeout                   = optional(number)
    worker_type               = optional(string)
    command                   = list(object({
            script_location = string
            name            = optional(string)
            python_version  = optional(string)
            runtime         = optional(string)
        }))
    execution_property        = optional(list(object({
            max_concurrent_runs = optional(number)
        })))
    notification_property     = optional(list(object({
            notify_delay_after = optional(number)
        })))
    source_control_details    = optional(list(object({
            auth_strategy  = optional(string)
            auth_token     = optional(string)
            branch         = optional(string)
            folder         = optional(string)
            last_commit_id = optional(string)
            owner          = optional(string)
            provider       = optional(string)
            repository     = optional(string)
        })))
  }))
}
