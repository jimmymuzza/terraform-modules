variable "vpc_dhcp_options" {
  description = <<EOT
Map of vpc_dhcp_options, attributes below
Optional:
    - domain_name
    - domain_name_servers
    - ipv6_address_preferred_lease_time
    - netbios_name_servers
    - netbios_node_type
    - ntp_servers
    - region
    - tags
    - tags_all
EOT

  type = map(object({
    domain_name                       = optional(string)
    domain_name_servers               = optional(list(string))
    ipv6_address_preferred_lease_time = optional(string)
    netbios_name_servers              = optional(list(string))
    netbios_node_type                 = optional(string)
    ntp_servers                       = optional(list(string))
    region                            = optional(string)
    tags                              = optional(map(string))
    tags_all                          = optional(map(string))
  }))
}
