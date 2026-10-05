variable "default_vpcs" {
  description = <<EOT
Map of default_vpcs, attributes below
Optional:
    - assign_generated_ipv6_cidr_block
    - enable_dns_hostnames
    - enable_dns_support
    - enable_network_address_usage_metrics
    - force_destroy
    - ipv6_cidr_block
    - ipv6_cidr_block_network_border_group
    - ipv6_ipam_pool_id
    - ipv6_netmask_length
    - region
    - tags
    - tags_all
EOT

  type = map(object({
    assign_generated_ipv6_cidr_block     = optional(bool)
    enable_dns_hostnames                 = optional(bool)
    enable_dns_support                   = optional(bool)
    enable_network_address_usage_metrics = optional(bool)
    force_destroy                        = optional(bool)
    ipv6_cidr_block                      = optional(string)
    ipv6_cidr_block_network_border_group = optional(string)
    ipv6_ipam_pool_id                    = optional(string)
    ipv6_netmask_length                  = optional(number)
    region                               = optional(string)
    tags                                 = optional(map(string))
    tags_all                             = optional(map(string))
  }))
}
