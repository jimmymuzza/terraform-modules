variable "vpn_gateway_connections" {
  description = <<EOT
Map of vpn_gateway_connections, attributes below
Required:
    - name
    - remote_vpn_site_id
    - vpn_gateway_id
    - vpn_link
Optional:
    - internet_security_enabled
    - routing
    - traffic_selector_policy
EOT

  type = map(object({
    name                      = string
    remote_vpn_site_id        = string
    vpn_gateway_id            = string
    internet_security_enabled = optional(bool)
    routing                   = optional(list(object({
            associated_route_table = string
            inbound_route_map_id   = optional(string)
            outbound_route_map_id  = optional(string)
            propagated_route_table = optional(list(object({
                route_table_ids = list(string)
                labels          = optional(set(string))
            })))
        })))
    traffic_selector_policy   = optional(set(object({
            local_address_ranges  = set(string)
            remote_address_ranges = set(string)
        })))
    vpn_link                  = list(object({
            name                                  = string
            vpn_site_link_id                      = string
            bandwidth_mbps                        = optional(number)
            bgp_enabled                           = optional(bool)
            connection_mode                       = optional(string)
            dpd_timeout_seconds                   = optional(number)
            egress_nat_rule_ids                   = optional(set(string))
            ingress_nat_rule_ids                  = optional(set(string))
            local_azure_ip_address_enabled        = optional(bool)
            policy_based_traffic_selector_enabled = optional(bool)
            protocol                              = optional(string)
            ratelimit_enabled                     = optional(bool)
            route_weight                          = optional(number)
            shared_key                            = optional(string)
            custom_bgp_address                    = optional(set(object({
                ip_address          = string
                ip_configuration_id = string
            })))
            ipsec_policy                          = optional(list(object({
                dh_group                 = string
                encryption_algorithm     = string
                ike_encryption_algorithm = string
                ike_integrity_algorithm  = string
                integrity_algorithm      = string
                pfs_group                = string
                sa_data_size_kb          = number
                sa_lifetime_sec          = number
            })))
        }))
  }))
}
