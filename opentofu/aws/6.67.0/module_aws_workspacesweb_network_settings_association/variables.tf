variable "workspacesweb_network_settings_associations" {
  description = <<EOT
Map of workspacesweb_network_settings_associations, attributes below
Required:
    - network_settings_arn
    - portal_arn
Optional:
    - region
EOT

  type = map(object({
    network_settings_arn = string
    portal_arn           = string
    region               = optional(string)
  }))
}
