variable "quicksight_key_registrations" {
  description = <<EOT
Map of quicksight_key_registrations, attributes below
Optional:
    - aws_account_id
    - region
    - key_registration
EOT

  type = map(object({
    aws_account_id   = optional(string)
    region           = optional(string)
    key_registration = optional(set(object({
            key_arn     = string
            default_key = optional(bool)
        })))
  }))
}
