variable "workspacesweb_data_protection_settings_associations" {
  description = <<EOT
Map of workspacesweb_data_protection_settings_associations, attributes below
Required:
    - data_protection_settings_arn
    - portal_arn
Optional:
    - region
EOT

  type = map(object({
    data_protection_settings_arn = string
    portal_arn                   = string
    region                       = optional(string)
  }))
}
