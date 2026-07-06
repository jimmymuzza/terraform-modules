variable "pinpoint_email_channels" {
  description = <<EOT
Map of pinpoint_email_channels, attributes below
Required:
    - application_id
    - from_address
    - identity
Optional:
    - configuration_set
    - enabled
    - orchestration_sending_role_arn
    - region
    - role_arn
EOT

  type = map(object({
    application_id                 = string
    from_address                   = string
    identity                       = string
    configuration_set              = optional(string)
    enabled                        = optional(bool)
    orchestration_sending_role_arn = optional(string)
    region                         = optional(string)
    role_arn                       = optional(string)
  }))
}
