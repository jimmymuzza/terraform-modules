variable "local_network_gateways" {
  description = <<EOT
Map of local_network_gateways, attributes below
Required:
    - location
    - name
    - resource_group_name
Optional:
    - address_space
    - gateway_address
    - gateway_fqdn
    - tags
    - bgp_settings
EOT

  type = map(object({
    location            = string
    name                = string
    resource_group_name = string
    address_space       = optional(set(string))
    gateway_address     = optional(string)
    gateway_fqdn        = optional(string)
    tags                = optional(map(string))
    bgp_settings        = optional(list(object({
            asn                 = number
            bgp_peering_address = string
            peer_weight         = optional(number)
        })))
  }))
}
