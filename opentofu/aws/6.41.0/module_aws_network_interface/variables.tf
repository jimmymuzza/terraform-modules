variable "network_interfaces" {
  description = <<EOT
Map of network_interfaces, attributes below
Required:
    - subnet_id
Optional:
    - description
    - enable_primary_ipv6
    - interface_type
    - ipv4_prefix_count
    - ipv4_prefixes
    - ipv6_address_count
    - ipv6_address_list
    - ipv6_address_list_enabled
    - ipv6_addresses
    - ipv6_prefix_count
    - ipv6_prefixes
    - private_ip
    - private_ip_list
    - private_ip_list_enabled
    - private_ips
    - private_ips_count
    - region
    - security_groups
    - source_dest_check
    - tags
    - tags_all
    - attachment
EOT

  type = map(object({
    subnet_id                 = string
    description               = optional(string)
    enable_primary_ipv6       = optional(bool)
    interface_type            = optional(string)
    ipv4_prefix_count         = optional(number)
    ipv4_prefixes             = optional(set(string))
    ipv6_address_count        = optional(number)
    ipv6_address_list         = optional(list(string))
    ipv6_address_list_enabled = optional(bool)
    ipv6_addresses            = optional(set(string))
    ipv6_prefix_count         = optional(number)
    ipv6_prefixes             = optional(set(string))
    private_ip                = optional(string)
    private_ip_list           = optional(list(string))
    private_ip_list_enabled   = optional(bool)
    private_ips               = optional(set(string))
    private_ips_count         = optional(number)
    region                    = optional(string)
    security_groups           = optional(set(string))
    source_dest_check         = optional(bool)
    tags                      = optional(map(string))
    tags_all                  = optional(map(string))
    attachment                = optional(set(object({
            device_index       = number
            instance           = string
            network_card_index = optional(number)
        })))
  }))
}
