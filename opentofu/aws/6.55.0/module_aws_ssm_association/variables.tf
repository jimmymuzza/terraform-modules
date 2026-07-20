variable "ssm_associations" {
  description = <<EOT
Map of ssm_associations, attributes below
Required:
    - name
Optional:
    - apply_only_at_cron_interval
    - association_name
    - automation_target_parameter_name
    - calendar_names
    - compliance_severity
    - document_version
    - max_concurrency
    - max_errors
    - parameters
    - region
    - schedule_expression
    - sync_compliance
    - tags
    - tags_all
    - wait_for_success_timeout_seconds
    - output_location
    - targets
EOT

  type = map(object({
    name                             = string
    apply_only_at_cron_interval      = optional(bool)
    association_name                 = optional(string)
    automation_target_parameter_name = optional(string)
    calendar_names                   = optional(set(string))
    compliance_severity              = optional(string)
    document_version                 = optional(string)
    max_concurrency                  = optional(string)
    max_errors                       = optional(string)
    parameters                       = optional(map(string))
    region                           = optional(string)
    schedule_expression              = optional(string)
    sync_compliance                  = optional(string)
    tags                             = optional(map(string))
    tags_all                         = optional(map(string))
    wait_for_success_timeout_seconds = optional(number)
    output_location                  = optional(list(object({
            s3_bucket_name = string
            s3_key_prefix  = optional(string)
            s3_region      = optional(string)
        })))
    targets                          = optional(list(object({
            key    = string
            values = list(string)
        })))
  }))
}
