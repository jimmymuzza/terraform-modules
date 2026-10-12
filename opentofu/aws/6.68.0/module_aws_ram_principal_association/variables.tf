variable "ram_principal_associations" {
  description = <<EOT
Map of ram_principal_associations, attributes below
Required:
    - principal
    - resource_share_arn
Optional:
    - region
EOT

  type = map(object({
    principal          = string
    resource_share_arn = string
    region             = optional(string)
  }))
}
