variable "workspacesweb_browser_settings_associations" {
  description = <<EOT
Map of workspacesweb_browser_settings_associations, attributes below
Required:
    - browser_settings_arn
    - portal_arn
Optional:
    - region
EOT

  type = map(object({
    browser_settings_arn = string
    portal_arn           = string
    region               = optional(string)
  }))
}
