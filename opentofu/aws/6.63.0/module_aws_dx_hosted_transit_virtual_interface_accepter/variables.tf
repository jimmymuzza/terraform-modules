variable "dx_hosted_transit_virtual_interface_accepters" {
  description = <<EOT
Map of dx_hosted_transit_virtual_interface_accepters, attributes below
Required:
    - dx_gateway_id
    - virtual_interface_id
Optional:
    - prefix_pool_allocated_count_ipv4
    - prefix_pool_allocated_count_ipv6
    - region
    - tags
    - tags_all
EOT

  type = map(object({
    dx_gateway_id                    = string
    virtual_interface_id             = string
    prefix_pool_allocated_count_ipv4 = optional(number)
    prefix_pool_allocated_count_ipv6 = optional(number)
    region                           = optional(string)
    tags                             = optional(map(string))
    tags_all                         = optional(map(string))
  }))
}
