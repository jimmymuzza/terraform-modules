variable "dx_hosted_public_virtual_interfaces" {
  description = <<EOT
Map of dx_hosted_public_virtual_interfaces, attributes below
Required:
    - address_family
    - bgp_asn
    - connection_id
    - name
    - owner_account_id
    - route_filter_prefixes
    - vlan
Optional:
    - amazon_address
    - bgp_auth_key
    - customer_address
    - region
EOT

  type = map(object({
    address_family        = string
    bgp_asn               = number
    connection_id         = string
    name                  = string
    owner_account_id      = string
    route_filter_prefixes = set(string)
    vlan                  = number
    amazon_address        = optional(string)
    bgp_auth_key          = optional(string)
    customer_address      = optional(string)
    region                = optional(string)
  }))
}
