variable "ec2_subnet_cidr_reservations" {
  description = <<EOT
Map of ec2_subnet_cidr_reservations, attributes below
Required:
    - cidr_block
    - reservation_type
    - subnet_id
Optional:
    - description
    - region
EOT

  type = map(object({
    cidr_block       = string
    reservation_type = string
    subnet_id        = string
    description      = optional(string)
    region           = optional(string)
  }))
}
