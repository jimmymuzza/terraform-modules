variable "dx_bgp_peers" {
  description = <<EOT
Map of dx_bgp_peers, attributes below
Required:
    - address_family
    - virtual_interface_id
Optional:
    - amazon_address
    - bgp_asn
    - bgp_asn_long
    - bgp_auth_key
    - customer_address
    - region
EOT

  type = map(object({
    address_family       = string
    virtual_interface_id = string
    amazon_address       = optional(string)
    bgp_asn              = optional(number)
    bgp_asn_long         = optional(string)
    bgp_auth_key         = optional(string)
    customer_address     = optional(string)
    region               = optional(string)
  }))
}
