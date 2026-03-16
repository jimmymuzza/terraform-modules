variable "route_tables" {
  description = <<EOT
Map of route_tables, attributes below
Required:
    - location
    - name
    - resource_group_name
Optional:
    - bgp_route_propagation_enabled
    - route
    - tags
EOT

  type = map(object({
    location                      = string
    name                          = string
    resource_group_name           = string
    bgp_route_propagation_enabled = optional(bool)
    route                         = optional(set(object({
            address_prefix = string
            name = string
            next_hop_in_ip_address = string
            next_hop_type = string
        })))
    tags                          = optional(map(string))
  }))
}
