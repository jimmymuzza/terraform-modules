variable "dx_private_virtual_interfaces" {
  description = <<EOT
Map of dx_private_virtual_interfaces, attributes below
Required:
    - address_family
    - connection_id
    - name
    - vlan
Optional:
    - amazon_address
    - bgp_asn
    - bgp_asn_long
    - bgp_auth_key
    - customer_address
    - dx_gateway_id
    - mtu
    - prefix_pool_allocated_count_ipv4
    - prefix_pool_allocated_count_ipv6
    - rate_limit
    - region
    - sitelink_enabled
    - tags
    - tags_all
    - vpn_gateway_id
EOT

  type = map(object({
    address_family                   = string
    connection_id                    = string
    name                             = string
    vlan                             = number
    amazon_address                   = optional(string)
    bgp_asn                          = optional(number)
    bgp_asn_long                     = optional(string)
    bgp_auth_key                     = optional(string)
    customer_address                 = optional(string)
    dx_gateway_id                    = optional(string)
    mtu                              = optional(number)
    prefix_pool_allocated_count_ipv4 = optional(number)
    prefix_pool_allocated_count_ipv6 = optional(number)
    rate_limit                       = optional(string)
    region                           = optional(string)
    sitelink_enabled                 = optional(bool)
    tags                             = optional(map(string))
    tags_all                         = optional(map(string))
    vpn_gateway_id                   = optional(string)
  }))
}
