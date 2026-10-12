variable "vpn_sites" {
  description = <<EOT
Map of vpn_sites, attributes below
Required:
    - location
    - name
    - resource_group_name
    - virtual_wan_id
Optional:
    - address_cidrs
    - device_model
    - device_vendor
    - tags
    - link
    - o365_policy
EOT

  type = map(object({
    location            = string
    name                = string
    resource_group_name = string
    virtual_wan_id      = string
    address_cidrs       = optional(set(string))
    device_model        = optional(string)
    device_vendor       = optional(string)
    tags                = optional(map(string))
    link                = optional(list(object({
            name          = string
            fqdn          = optional(string)
            ip_address    = optional(string)
            provider_name = optional(string)
            speed_in_mbps = optional(number)
            bgp           = optional(list(object({
                asn             = number
                peering_address = string
            })))
        })))
    o365_policy         = optional(list(object({
            traffic_category = optional(list(object({
                allow_endpoint_enabled    = optional(bool)
                default_endpoint_enabled  = optional(bool)
                optimize_endpoint_enabled = optional(bool)
            })))
        })))
  }))
}
