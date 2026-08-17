variable "virtual_hubs" {
  description = <<EOT
Map of virtual_hubs, attributes below
Required:
    - location
    - name
    - resource_group_name
Optional:
    - address_prefix
    - branch_to_branch_traffic_enabled
    - hub_routing_preference
    - sku
    - tags
    - virtual_router_auto_scale_min_capacity
    - virtual_wan_id
    - route
EOT

  type = map(object({
    location                               = string
    name                                   = string
    resource_group_name                    = string
    address_prefix                         = optional(string)
    branch_to_branch_traffic_enabled       = optional(bool)
    hub_routing_preference                 = optional(string)
    sku                                    = optional(string)
    tags                                   = optional(map(string))
    virtual_router_auto_scale_min_capacity = optional(number)
    virtual_wan_id                         = optional(string)
    route                                  = optional(set(object({
            address_prefixes    = list(string)
            next_hop_ip_address = string
        })))
  }))
}
