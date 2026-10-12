variable "ram_resource_associations" {
  description = <<EOT
Map of ram_resource_associations, attributes below
Required:
    - resource_arn
    - resource_share_arn
Optional:
    - region
EOT

  type = map(object({
    resource_arn       = string
    resource_share_arn = string
    region             = optional(string)
  }))
}
