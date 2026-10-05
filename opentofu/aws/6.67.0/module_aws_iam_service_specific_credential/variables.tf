variable "iam_service_specific_credentials" {
  description = <<EOT
Map of iam_service_specific_credentials, attributes below
Required:
    - service_name
    - user_name
Optional:
    - credential_age_days
    - status
EOT

  type = map(object({
    service_name        = string
    user_name           = string
    credential_age_days = optional(number)
    status              = optional(string)
  }))
}
