variable "virtual_network_gateways" {
  description = <<EOT
Map of virtual_network_gateways, attributes below
Required:
    - location
    - name
    - resource_group_name
    - sku
    - type
    - ip_configuration
Optional:
    - active_active
    - bgp_enabled
    - bgp_route_translation_for_nat_enabled
    - default_local_network_gateway_id
    - dns_forwarding_enabled
    - edge_zone
    - generation
    - ip_sec_replay_protection_enabled
    - maximum_scale_unit
    - minimum_scale_unit
    - private_ip_address_enabled
    - remote_vnet_traffic_enabled
    - tags
    - virtual_wan_traffic_enabled
    - vpn_type
    - bgp_settings
    - custom_route
    - policy_group
    - vpn_client_configuration
EOT

  type = map(object({
    location                              = string
    name                                  = string
    resource_group_name                   = string
    sku                                   = string
    type                                  = string
    active_active                         = optional(bool)
    bgp_enabled                           = optional(bool)
    bgp_route_translation_for_nat_enabled = optional(bool)
    default_local_network_gateway_id      = optional(string)
    dns_forwarding_enabled                = optional(bool)
    edge_zone                             = optional(string)
    generation                            = optional(string)
    ip_sec_replay_protection_enabled      = optional(bool)
    maximum_scale_unit                    = optional(number)
    minimum_scale_unit                    = optional(number)
    private_ip_address_enabled            = optional(bool)
    remote_vnet_traffic_enabled           = optional(bool)
    tags                                  = optional(map(string))
    virtual_wan_traffic_enabled           = optional(bool)
    vpn_type                              = optional(string)
    bgp_settings                          = optional(list(object({
            asn               = optional(number)
            peer_weight       = optional(number)
            peering_addresses = optional(list(object({
                apipa_addresses       = optional(list(string))
                ip_configuration_name = optional(string)
            })))
        })))
    custom_route                          = optional(list(object({
            address_prefixes = optional(set(string))
        })))
    ip_configuration                      = list(object({
            subnet_id                     = string
            name                          = optional(string)
            private_ip_address_allocation = optional(string)
            public_ip_address_id          = optional(string)
        }))
    policy_group                          = optional(list(object({
            name          = string
            is_default    = optional(bool)
            priority      = optional(number)
            policy_member = list(object({
                name  = string
                type  = string
                value = string
            }))
        })))
    vpn_client_configuration              = optional(list(object({
            address_space                             = list(string)
            aad_audience                              = optional(string)
            aad_issuer                                = optional(string)
            aad_tenant                                = optional(string)
            radius_server_address                     = optional(string)
            radius_server_secret                      = optional(string)
            vpn_auth_types                            = optional(set(string))
            vpn_client_protocols                      = optional(set(string))
            ipsec_policy                              = optional(list(object({
                dh_group                  = string
                ike_encryption            = string
                ike_integrity             = string
                ipsec_encryption          = string
                ipsec_integrity           = string
                pfs_group                 = string
                sa_data_size_in_kilobytes = number
                sa_lifetime_in_seconds    = number
            })))
            radius_server                             = optional(list(object({
                address = string
                score   = number
                secret  = string
            })))
            revoked_certificate                       = optional(set(object({
                name       = string
                thumbprint = string
            })))
            root_certificate                          = optional(set(object({
                name             = string
                public_cert_data = string
            })))
            virtual_network_gateway_client_connection = optional(list(object({
                address_prefixes   = list(string)
                name               = string
                policy_group_names = list(string)
            })))
        })))
  }))
}
