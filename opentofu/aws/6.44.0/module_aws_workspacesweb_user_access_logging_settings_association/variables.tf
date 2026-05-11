variable "workspacesweb_user_access_logging_settings_associations" {
  description = <<EOT
Map of workspacesweb_user_access_logging_settings_associations, attributes below
Required:
    - portal_arn
    - user_access_logging_settings_arn
Optional:
    - region
EOT

  type = map(object({
    portal_arn                       = string
    user_access_logging_settings_arn = string
    region                           = optional(string)
  }))
}
