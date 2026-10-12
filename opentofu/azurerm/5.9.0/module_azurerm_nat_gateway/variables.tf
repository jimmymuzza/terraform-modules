variable "nat_gateways" {
  description = <<EOT
Map of nat_gateways, attributes below
Required:
    - location
    - name
    - resource_group_name
Optional:
    - idle_timeout_in_minutes
    - sku_name
    - tags
    - zones
EOT

  type = map(object({
    location                = string
    name                    = string
    resource_group_name     = string
    idle_timeout_in_minutes = optional(number)
    sku_name                = optional(string)
    tags                    = optional(map(string))
    zones                   = optional(set(string))
  }))
}
