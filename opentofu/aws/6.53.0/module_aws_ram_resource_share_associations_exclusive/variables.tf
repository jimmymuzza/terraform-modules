variable "ram_resource_share_associations_exclusives" {
  description = <<EOT
Map of ram_resource_share_associations_exclusives, attributes below
Required:
    - resource_share_arn
Optional:
    - principals
    - region
    - resource_arns
    - sources
EOT

  type = map(object({
    resource_share_arn = string
    principals         = optional(set(string))
    region             = optional(string)
    resource_arns      = optional(set(string))
    sources            = optional(set(string))
  }))
}
