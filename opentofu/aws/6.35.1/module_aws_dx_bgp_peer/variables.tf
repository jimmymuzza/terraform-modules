variable "dx_bgp_peers" {
  description = <<EOT
Map of dx_bgp_peers, attributes below
Required:
    - address_family
    - bgp_asn
    - virtual_interface_id
Optional:
    - amazon_address
    - bgp_auth_key
    - customer_address
    - region
EOT

  type = map(object({
    address_family       = string
    bgp_asn              = number
    virtual_interface_id = string
    amazon_address       = optional(string)
    bgp_auth_key         = optional(string)
    customer_address     = optional(string)
    region               = optional(string)
  }))
}
