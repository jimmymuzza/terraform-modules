variable "vpc_ipv4_cidr_block_associations" {
  description = <<EOT
Map of vpc_ipv4_cidr_block_associations, attributes below
Required:
    - vpc_id
Optional:
    - cidr_block
    - ipv4_ipam_pool_id
    - ipv4_netmask_length
    - region
EOT

  type = map(object({
    vpc_id              = string
    cidr_block          = optional(string)
    ipv4_ipam_pool_id   = optional(string)
    ipv4_netmask_length = optional(number)
    region              = optional(string)
  }))
}
