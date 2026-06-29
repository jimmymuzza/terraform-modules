variable "nat_gateways" {
  description = <<EOT
Map of nat_gateways, attributes below
Optional:
    - allocation_id
    - availability_mode
    - connectivity_type
    - private_ip
    - region
    - secondary_allocation_ids
    - secondary_private_ip_address_count
    - secondary_private_ip_addresses
    - subnet_id
    - tags
    - tags_all
    - vpc_id
    - availability_zone_address
EOT

  type = map(object({
    allocation_id                      = optional(string)
    availability_mode                  = optional(string)
    connectivity_type                  = optional(string)
    private_ip                         = optional(string)
    region                             = optional(string)
    secondary_allocation_ids           = optional(set(string))
    secondary_private_ip_address_count = optional(number)
    secondary_private_ip_addresses     = optional(set(string))
    subnet_id                          = optional(string)
    tags                               = optional(map(string))
    tags_all                           = optional(map(string))
    vpc_id                             = optional(string)
    availability_zone_address          = optional(set(object({
            allocation_ids       = optional(set(string))
            availability_zone    = optional(string)
            availability_zone_id = optional(string)
        })))
  }))
}
