variable "workspacesweb_trust_store_associations" {
  description = <<EOT
Map of workspacesweb_trust_store_associations, attributes below
Required:
    - portal_arn
    - trust_store_arn
Optional:
    - region
EOT

  type = map(object({
    portal_arn      = string
    trust_store_arn = string
    region          = optional(string)
  }))
}
