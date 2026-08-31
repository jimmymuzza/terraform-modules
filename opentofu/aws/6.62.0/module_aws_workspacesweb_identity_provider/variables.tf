variable "workspacesweb_identity_providers" {
  description = <<EOT
Map of workspacesweb_identity_providers, attributes below
Required:
    - identity_provider_details
    - identity_provider_name
    - identity_provider_type
    - portal_arn
Optional:
    - region
    - tags
EOT

  type = map(object({
    identity_provider_details = map(string)
    identity_provider_name    = string
    identity_provider_type    = string
    portal_arn                = string
    region                    = optional(string)
    tags                      = optional(map(string))
  }))
}
