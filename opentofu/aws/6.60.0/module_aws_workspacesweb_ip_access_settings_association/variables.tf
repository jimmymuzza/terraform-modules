variable "workspacesweb_ip_access_settings_associations" {
  description = <<EOT
Map of workspacesweb_ip_access_settings_associations, attributes below
Required:
    - ip_access_settings_arn
    - portal_arn
Optional:
    - region
EOT

  type = map(object({
    ip_access_settings_arn = string
    portal_arn             = string
    region                 = optional(string)
  }))
}
