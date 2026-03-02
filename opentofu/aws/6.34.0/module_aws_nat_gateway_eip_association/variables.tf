variable "nat_gateway_eip_associations" {
  description = <<EOT
Map of nat_gateway_eip_associations, attributes below
Required:
    - allocation_id
    - nat_gateway_id
Optional:
    - region
EOT

  type = map(object({
    allocation_id  = string
    nat_gateway_id = string
    region         = optional(string)
  }))
}
