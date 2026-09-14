variable "express_route_circuits" {
  description = <<EOT
Map of express_route_circuits, attributes below
Required:
    - location
    - name
    - resource_group_name
    - sku
Optional:
    - allow_classic_operations
    - authorization_key
    - bandwidth_in_gbps
    - bandwidth_in_mbps
    - express_route_port_id
    - peering_location
    - rate_limiting_enabled
    - service_provider_name
    - tags
EOT

  type = map(object({
    location                 = string
    name                     = string
    resource_group_name      = string
    allow_classic_operations = optional(bool)
    authorization_key        = optional(string)
    bandwidth_in_gbps        = optional(number)
    bandwidth_in_mbps        = optional(number)
    express_route_port_id    = optional(string)
    peering_location         = optional(string)
    rate_limiting_enabled    = optional(bool)
    service_provider_name    = optional(string)
    tags                     = optional(map(string))
    sku                      = list(object({
            family = string
            tier   = string
        }))
  }))
}
