variable "application_app_roles" {
  description = <<EOT
Map of application_app_roles, attributes below
Required:
    - allowed_member_types
    - application_id
    - description
    - display_name
    - role_id
Optional:
    - value
EOT

  type = map(object({
    allowed_member_types = set(string)
    application_id       = string
    description          = string
    display_name         = string
    role_id              = string
    value                = optional(string)
  }))
}
