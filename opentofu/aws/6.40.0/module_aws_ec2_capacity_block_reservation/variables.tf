variable "ec2_capacity_block_reservations" {
  description = <<EOT
Map of ec2_capacity_block_reservations, attributes below
Required:
    - capacity_block_offering_id
    - instance_platform
Optional:
    - region
    - tags
EOT

  type = map(object({
    capacity_block_offering_id = string
    instance_platform          = string
    region                     = optional(string)
    tags                       = optional(map(string))
  }))
}
