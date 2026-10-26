variable "dx_hosted_public_virtual_interfaces" {
  description = <<EOT
Map of dx_hosted_public_virtual_interfaces, attributes below
Required:
    - address_family
    - connection_id
    - name
    - owner_account_id
    - route_filter_prefixes
    - vlan
Optional:
    - amazon_address
    - bgp_asn
    - bgp_asn_long
    - bgp_auth_key
    - customer_address
    - rate_limit
    - region
EOT

  type = map(object({
    address_family        = string
    connection_id         = string
    name                  = string
    owner_account_id      = string
    route_filter_prefixes = set(string)
    vlan                  = number
    amazon_address        = optional(string)
    bgp_asn               = optional(number)
    bgp_asn_long          = optional(string)
    bgp_auth_key          = optional(string)
    customer_address      = optional(string)
    rate_limit            = optional(string)
    region                = optional(string)
  }))
}
