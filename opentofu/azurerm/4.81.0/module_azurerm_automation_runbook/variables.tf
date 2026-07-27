variable "automation_runbooks" {
  description = <<EOT
Map of automation_runbooks, attributes below
Required:
    - automation_account_name
    - location
    - log_progress
    - log_verbose
    - name
    - resource_group_name
    - runbook_type
Optional:
    - content
    - description
    - job_schedule
    - log_activity_trace_level
    - runtime_environment_name
    - tags
    - draft
    - publish_content_link
EOT

  type = map(object({
    automation_account_name  = string
    location                 = string
    log_progress             = bool
    log_verbose              = bool
    name                     = string
    resource_group_name      = string
    runbook_type             = string
    content                  = optional(string)
    description              = optional(string)
    job_schedule             = optional(set(object({
            job_schedule_id = string
            parameters = map(string)
            run_on = string
            schedule_name = string
        })))
    log_activity_trace_level = optional(number)
    runtime_environment_name = optional(string)
    tags                     = optional(map(string))
    draft                    = optional(list(object({
            edit_mode_enabled = optional(bool)
            output_types      = optional(list(string))
            content_link      = optional(list(object({
                uri     = string
                version = optional(string)
                hash    = optional(list(object({
                    algorithm = string
                    value     = string
                })))
            })))
            parameters        = optional(list(object({
                key           = string
                type          = string
                default_value = optional(string)
                mandatory     = optional(bool)
                position      = optional(number)
            })))
        })))
    publish_content_link     = optional(list(object({
            uri     = string
            version = optional(string)
            hash    = optional(list(object({
                algorithm = string
                value     = string
            })))
        })))
  }))
}
