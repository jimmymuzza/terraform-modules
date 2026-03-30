variable "ssoadmin_application_access_scopes" {
  description = <<EOT
Map of ssoadmin_application_access_scopes, attributes below
Required:
    - application_arn
    - scope
Optional:
    - authorized_targets
    - region
EOT

  type = map(object({
    application_arn    = string
    scope              = string
    authorized_targets = optional(list(string))
    region             = optional(string)
  }))
}
