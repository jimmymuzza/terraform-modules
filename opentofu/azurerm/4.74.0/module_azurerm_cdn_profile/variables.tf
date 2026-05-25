variable "cdn_profiles" {
  description = <<EOT
Map of cdn_profiles, attributes below
Required:
    - location
    - name
    - resource_group_name
    - sku
Optional:
    - tags
EOT

  type = map(object({
    location            = string
    name                = string
    resource_group_name = string
    sku                 = string
    tags                = optional(map(string))
  }))
}
