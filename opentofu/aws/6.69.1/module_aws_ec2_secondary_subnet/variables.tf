variable "ec2_secondary_subnets" {
  description = <<EOT
Map of ec2_secondary_subnets, attributes below
Required:
    - ipv4_cidr_block
    - secondary_network_id
Optional:
    - availability_zone
    - availability_zone_id
    - region
    - tags
EOT

  type = map(object({
    ipv4_cidr_block      = string
    secondary_network_id = string
    availability_zone    = optional(string)
    availability_zone_id = optional(string)
    region               = optional(string)
    tags                 = optional(map(string))
  }))
}
