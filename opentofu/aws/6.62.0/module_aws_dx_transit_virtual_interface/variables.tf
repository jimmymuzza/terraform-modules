variable "dx_transit_virtual_interfaces" {
  description = <<EOT
Map of dx_transit_virtual_interfaces, attributes below
Required:
    - address_family
    - connection_id
    - dx_gateway_id
    - name
    - vlan
Optional:
    - amazon_address
    - bgp_asn
    - bgp_asn_long
    - bgp_auth_key
    - customer_address
    - mtu
    - region
    - sitelink_enabled
    - tags
    - tags_all
EOT

  type = map(object({
    address_family   = string
    connection_id    = string
    dx_gateway_id    = string
    name             = string
    vlan             = number
    amazon_address   = optional(string)
    bgp_asn          = optional(number)
    bgp_asn_long     = optional(string)
    bgp_auth_key     = optional(string)
    customer_address = optional(string)
    mtu              = optional(number)
    region           = optional(string)
    sitelink_enabled = optional(bool)
    tags             = optional(map(string))
    tags_all         = optional(map(string))
  }))
}
