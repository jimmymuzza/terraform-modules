variable "express_route_circuit_peerings" {
  description = <<EOT
Map of express_route_circuit_peerings, attributes below
Required:
    - express_route_circuit_name
    - peering_type
    - resource_group_name
    - vlan_id
Optional:
    - ipv4_enabled
    - peer_asn
    - primary_peer_address_prefix
    - route_filter_id
    - secondary_peer_address_prefix
    - shared_key
    - ipv6
    - microsoft_peering_config
EOT

  type = map(object({
    express_route_circuit_name    = string
    peering_type                  = string
    resource_group_name           = string
    vlan_id                       = number
    ipv4_enabled                  = optional(bool)
    peer_asn                      = optional(number)
    primary_peer_address_prefix   = optional(string)
    route_filter_id               = optional(string)
    secondary_peer_address_prefix = optional(string)
    shared_key                    = optional(string)
    ipv6                          = optional(list(object({
            primary_peer_address_prefix   = string
            secondary_peer_address_prefix = string
            enabled                       = optional(bool)
            route_filter_id               = optional(string)
            microsoft_peering             = optional(list(object({
                advertised_communities     = optional(list(string))
                advertised_public_prefixes = optional(list(string))
                customer_asn               = optional(number)
                routing_registry_name      = optional(string)
            })))
        })))
    microsoft_peering_config      = optional(list(object({
            advertised_public_prefixes = list(string)
            advertised_communities     = optional(list(string))
            customer_asn               = optional(number)
            routing_registry_name      = optional(string)
        })))
  }))
}
