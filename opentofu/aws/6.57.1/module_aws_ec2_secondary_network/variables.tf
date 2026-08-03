variable "ec2_secondary_networks" {
  description = <<EOT
Map of ec2_secondary_networks, attributes below
Required:
    - ipv4_cidr_block
    - network_type
Optional:
    - region
    - tags
EOT

  type = map(object({
    ipv4_cidr_block = string
    network_type    = string
    region          = optional(string)
    tags            = optional(map(string))
  }))
}
