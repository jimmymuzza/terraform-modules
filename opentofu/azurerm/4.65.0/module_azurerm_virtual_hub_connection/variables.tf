variable "virtual_hub_connections" {
  description = <<EOT
Map of virtual_hub_connections, attributes below
Required:
    - name
    - remote_virtual_network_id
    - virtual_hub_id
Optional:
    - internet_security_enabled
    - routing
EOT

  type = map(object({
    name                      = string
    remote_virtual_network_id = string
    virtual_hub_id            = string
    internet_security_enabled = optional(bool)
    routing                   = optional(list(object({
            associated_route_table_id                   = optional(string)
            inbound_route_map_id                        = optional(string)
            outbound_route_map_id                       = optional(string)
            static_vnet_local_route_override_criteria   = optional(string)
            static_vnet_propagate_static_routes_enabled = optional(bool)
            propagated_route_table                      = optional(list(object({
                labels          = optional(set(string))
                route_table_ids = optional(list(string))
            })))
            static_vnet_route                           = optional(list(object({
                address_prefixes    = optional(set(string))
                name                = optional(string)
                next_hop_ip_address = optional(string)
            })))
        })))
  }))
}
