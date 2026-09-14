variable "lambdamicrovms_microvms" {
  description = <<EOT
Map of lambdamicrovms_microvms, attributes below
Required:
    - image_arn
Optional:
    - egress_network_connectors
    - execution_role_arn
    - image_version
    - ingress_network_connectors
    - maximum_duration_in_seconds
    - region
    - run_hook_payload
    - idle_policy
    - logging
EOT

  type = map(object({
    image_arn                   = string
    egress_network_connectors   = optional(list(string))
    execution_role_arn          = optional(string)
    image_version               = optional(string)
    ingress_network_connectors  = optional(list(string))
    maximum_duration_in_seconds = optional(number)
    region                      = optional(string)
    run_hook_payload            = optional(string)
    idle_policy                 = optional(list(object({
            auto_resume_enabled        = bool
            max_idle_duration_seconds  = number
            suspended_duration_seconds = number
        })))
    logging                     = optional(list(object({
            cloudwatch = optional(list(object({
                log_group  = optional(string)
                log_stream = optional(string)
            })))
            disabled   = optional(list(object({

            })))
        })))
  }))
}
