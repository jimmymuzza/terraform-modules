variable "sesv2_tenants" {
  description = <<EOT
Map of sesv2_tenants, attributes below
Required:
    - tenant_name
Optional:
    - region
    - tags
EOT

  type = map(object({
    tenant_name = string
    region      = optional(string)
    tags        = optional(map(string))
  }))
}
