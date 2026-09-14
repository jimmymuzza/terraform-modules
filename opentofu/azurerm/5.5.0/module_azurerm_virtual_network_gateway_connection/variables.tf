variable "virtual_network_gateway_connections" {
  description = <<EOT
Map of virtual_network_gateway_connections, attributes below
Required:
    - location
    - name
    - resource_group_name
    - type
    - virtual_network_gateway_id
Optional:
    - authorization_key
    - bgp_enabled
    - connection_mode
    - connection_protocol
    - dpd_timeout_seconds
    - egress_nat_rule_ids
    - express_route_circuit_id
    - express_route_gateway_bypass
    - ingress_nat_rule_ids
    - local_azure_ip_address_enabled
    - local_network_gateway_id
    - peer_virtual_network_gateway_id
    - private_link_fast_path_enabled
    - routing_weight
    - shared_key
    - tags
    - use_policy_based_traffic_selectors
    - custom_bgp_addresses
    - ipsec_policy
    - traffic_selector_policy
EOT

  type = map(object({
    location                           = string
    name                               = string
    resource_group_name                = string
    type                               = string
    virtual_network_gateway_id         = string
    authorization_key                  = optional(string)
    bgp_enabled                        = optional(bool)
    connection_mode                    = optional(string)
    connection_protocol                = optional(string)
    dpd_timeout_seconds                = optional(number)
    egress_nat_rule_ids                = optional(set(string))
    express_route_circuit_id           = optional(string)
    express_route_gateway_bypass       = optional(bool)
    ingress_nat_rule_ids               = optional(set(string))
    local_azure_ip_address_enabled     = optional(bool)
    local_network_gateway_id           = optional(string)
    peer_virtual_network_gateway_id    = optional(string)
    private_link_fast_path_enabled     = optional(bool)
    routing_weight                     = optional(number)
    shared_key                         = optional(string)
    tags                               = optional(map(string))
    use_policy_based_traffic_selectors = optional(bool)
    custom_bgp_addresses               = optional(list(object({
            primary   = string
            secondary = optional(string)
        })))
    ipsec_policy                       = optional(list(object({
            dh_group         = string
            ike_encryption   = string
            ike_integrity    = string
            ipsec_encryption = string
            ipsec_integrity  = string
            pfs_group        = string
            sa_datasize      = optional(number)
            sa_lifetime      = optional(number)
        })))
    traffic_selector_policy            = optional(list(object({
            local_address_cidrs  = list(string)
            remote_address_cidrs = list(string)
        })))
  }))
}
