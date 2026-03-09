variable "dx_hosted_transit_virtual_interfaces" {
  description = <<EOT
Map of dx_hosted_transit_virtual_interfaces, attributes below
Required:
    - address_family
    - bgp_asn
    - connection_id
    - name
    - owner_account_id
    - vlan
Optional:
    - amazon_address
    - bgp_auth_key
    - customer_address
    - mtu
    - region
EOT

  type = map(object({
    address_family   = string
    bgp_asn          = number
    connection_id    = string
    name             = string
    owner_account_id = string
    vlan             = number
    amazon_address   = optional(string)
    bgp_auth_key     = optional(string)
    customer_address = optional(string)
    mtu              = optional(number)
    region           = optional(string)
  }))
}
