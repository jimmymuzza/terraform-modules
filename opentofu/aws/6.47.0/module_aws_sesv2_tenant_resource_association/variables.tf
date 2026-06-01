variable "sesv2_tenant_resource_associations" {
  description = <<EOT
Map of sesv2_tenant_resource_associations, attributes below
Required:
    - resource_arn
    - tenant_name
Optional:
    - region
EOT

  type = map(object({
    resource_arn = string
    tenant_name  = string
    region       = optional(string)
  }))
}
