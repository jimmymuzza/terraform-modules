variable "vpc_ipv6_cidr_block_associations" {
  description = <<EOT
Map of vpc_ipv6_cidr_block_associations, attributes below
Required:
    - vpc_id
Optional:
    - assign_generated_ipv6_cidr_block
    - ipv6_cidr_block
    - ipv6_ipam_pool_id
    - ipv6_netmask_length
    - ipv6_pool
    - region
EOT

  type = map(object({
    vpc_id                           = string
    assign_generated_ipv6_cidr_block = optional(bool)
    ipv6_cidr_block                  = optional(string)
    ipv6_ipam_pool_id                = optional(string)
    ipv6_netmask_length              = optional(number)
    ipv6_pool                        = optional(string)
    region                           = optional(string)
  }))
}
