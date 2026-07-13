variable "point_to_site_vpn_gateways" {
  description = <<EOT
Map of point_to_site_vpn_gateways, attributes below
Required:
    - location
    - name
    - resource_group_name
    - scale_unit
    - virtual_hub_id
    - vpn_server_configuration_id
    - connection_configuration
Optional:
    - dns_servers
    - routing_preference_internet_enabled
    - tags
EOT

  type = map(object({
    location                            = string
    name                                = string
    resource_group_name                 = string
    scale_unit                          = number
    virtual_hub_id                      = string
    vpn_server_configuration_id         = string
    dns_servers                         = optional(list(string))
    routing_preference_internet_enabled = optional(bool)
    tags                                = optional(map(string))
    connection_configuration            = list(object({
            name                      = string
            internet_security_enabled = optional(bool)
            route                     = optional(list(object({
                associated_route_table_id = string
                inbound_route_map_id      = optional(string)
                outbound_route_map_id     = optional(string)
                propagated_route_table    = optional(list(object({
                    ids    = list(string)
                    labels = optional(set(string))
                })))
            })))
            vpn_client_address_pool   = list(object({
                address_prefixes = set(string)
            }))
        }))
  }))
}
