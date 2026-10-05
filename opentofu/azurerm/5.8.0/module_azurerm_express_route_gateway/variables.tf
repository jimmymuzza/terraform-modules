variable "express_route_gateways" {
  description = <<EOT
Map of express_route_gateways, attributes below
Required:
    - location
    - name
    - resource_group_name
    - scale_units
    - virtual_hub_id
Optional:
    - allow_non_virtual_wan_traffic
    - tags
EOT

  type = map(object({
    location                      = string
    name                          = string
    resource_group_name           = string
    scale_units                   = number
    virtual_hub_id                = string
    allow_non_virtual_wan_traffic = optional(bool)
    tags                          = optional(map(string))
  }))
}
