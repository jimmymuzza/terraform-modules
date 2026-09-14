variable "vpn_gateways" {
  description = <<EOT
Map of vpn_gateways, attributes below
Required:
    - location
    - name
    - resource_group_name
    - virtual_hub_id
Optional:
    - bgp_route_translation_for_nat_enabled
    - routing_preference
    - scale_unit
    - tags
    - bgp_settings
EOT

  type = map(object({
    location                              = string
    name                                  = string
    resource_group_name                   = string
    virtual_hub_id                        = string
    bgp_route_translation_for_nat_enabled = optional(bool)
    routing_preference                    = optional(string)
    scale_unit                            = optional(number)
    tags                                  = optional(map(string))
    bgp_settings                          = optional(list(object({
            asn                            = number
            peer_weight                    = number
            instance_0_bgp_peering_address = optional(list(object({
                custom_ips = set(string)
            })))
            instance_1_bgp_peering_address = optional(list(object({
                custom_ips = set(string)
            })))
        })))
  }))
}
