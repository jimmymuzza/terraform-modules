variable "quicksight_account_settings" {
  description = <<EOT
Map of quicksight_account_settings, attributes below
Optional:
    - aws_account_id
    - default_namespace
    - region
    - termination_protection_enabled
EOT

  type = map(object({
    aws_account_id                 = optional(string)
    default_namespace              = optional(string)
    region                         = optional(string)
    termination_protection_enabled = optional(bool)
  }))
}
