variable "virtual_network_peerings" {
  description = <<EOT
Map of virtual_network_peerings, attributes below
Required:
    - name
    - remote_virtual_network_id
    - resource_group_name
    - virtual_network_name
Optional:
    - allow_forwarded_traffic
    - allow_gateway_transit
    - allow_virtual_network_access
    - local_subnet_names
    - only_ipv6_peering_enabled
    - peer_complete_virtual_networks_enabled
    - remote_subnet_names
    - triggers
    - use_remote_gateways
EOT

  type = map(object({
    name                                   = string
    remote_virtual_network_id              = string
    resource_group_name                    = string
    virtual_network_name                   = string
    allow_forwarded_traffic                = optional(bool)
    allow_gateway_transit                  = optional(bool)
    allow_virtual_network_access           = optional(bool)
    local_subnet_names                     = optional(list(string))
    only_ipv6_peering_enabled              = optional(bool)
    peer_complete_virtual_networks_enabled = optional(bool)
    remote_subnet_names                    = optional(list(string))
    triggers                               = optional(map(string))
    use_remote_gateways                    = optional(bool)
  }))
}
