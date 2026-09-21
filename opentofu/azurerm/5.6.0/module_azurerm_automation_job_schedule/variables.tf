variable "automation_job_schedules" {
  description = <<EOT
Map of automation_job_schedules, attributes below
Required:
    - automation_account_name
    - resource_group_name
    - runbook_name
    - schedule_name
Optional:
    - job_schedule_id
    - parameters
    - run_on
EOT

  type = map(object({
    automation_account_name = string
    resource_group_name     = string
    runbook_name            = string
    schedule_name           = string
    job_schedule_id         = optional(string)
    parameters              = optional(map(string))
    run_on                  = optional(string)
  }))
}
