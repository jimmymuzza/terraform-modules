variable "public_ip_prefixes" {
  description = <<EOT
Map of public_ip_prefixes, attributes below
Required:
    - location
    - name
    - resource_group_name
Optional:
    - custom_ip_prefix_id
    - ip_version
    - prefix_length
    - sku
    - sku_tier
    - tags
    - zones
EOT

  type = map(object({
    location            = string
    name                = string
    resource_group_name = string
    custom_ip_prefix_id = optional(string)
    ip_version          = optional(string)
    prefix_length       = optional(number)
    sku                 = optional(string)
    sku_tier            = optional(string)
    tags                = optional(map(string))
    zones               = optional(set(string))
  }))
}
