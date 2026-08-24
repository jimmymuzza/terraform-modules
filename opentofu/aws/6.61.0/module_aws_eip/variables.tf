variable "eips" {
  description = <<EOT
Map of eips, attributes below
Optional:
    - address
    - associate_with_private_ip
    - customer_owned_ipv4_pool
    - domain
    - instance
    - ipam_pool_id
    - network_border_group
    - network_interface
    - public_ipv4_pool
    - region
    - tags
    - tags_all
EOT

  type = map(object({
    address                   = optional(string)
    associate_with_private_ip = optional(string)
    customer_owned_ipv4_pool  = optional(string)
    domain                    = optional(string)
    instance                  = optional(string)
    ipam_pool_id              = optional(string)
    network_border_group      = optional(string)
    network_interface         = optional(string)
    public_ipv4_pool          = optional(string)
    region                    = optional(string)
    tags                      = optional(map(string))
    tags_all                  = optional(map(string))
  }))
}
