variable "application_permission_scopes" {
  description = <<EOT
Map of application_permission_scopes, attributes below
Required:
    - admin_consent_description
    - admin_consent_display_name
    - application_id
    - scope_id
    - value
Optional:
    - type
    - user_consent_description
    - user_consent_display_name
EOT

  type = map(object({
    admin_consent_description  = string
    admin_consent_display_name = string
    application_id             = string
    scope_id                   = string
    value                      = string
    type                       = optional(string)
    user_consent_description   = optional(string)
    user_consent_display_name  = optional(string)
  }))
}
