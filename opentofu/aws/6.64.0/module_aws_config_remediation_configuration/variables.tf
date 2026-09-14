variable "config_remediation_configurations" {
  description = <<EOT
Map of config_remediation_configurations, attributes below
Required:
    - config_rule_name
    - target_id
    - target_type
Optional:
    - automatic
    - maximum_automatic_attempts
    - region
    - resource_type
    - retry_attempt_seconds
    - target_version
    - execution_controls
    - parameter
EOT

  type = map(object({
    config_rule_name           = string
    target_id                  = string
    target_type                = string
    automatic                  = optional(bool)
    maximum_automatic_attempts = optional(number)
    region                     = optional(string)
    resource_type              = optional(string)
    retry_attempt_seconds      = optional(number)
    target_version             = optional(string)
    execution_controls         = optional(list(object({
            ssm_controls = optional(list(object({
                concurrent_execution_rate_percentage = optional(number)
                error_percentage                     = optional(number)
            })))
        })))
    parameter                  = optional(list(object({
            name           = string
            resource_value = optional(string)
            static_value   = optional(string)
            static_values  = optional(list(string))
        })))
  }))
}
