variable "ec2_transit_gateway_default_route_table_associations" {
  description = <<EOT
Map of ec2_transit_gateway_default_route_table_associations, attributes below
Required:
    - transit_gateway_id
    - transit_gateway_route_table_id
Optional:
    - region
EOT

  type = map(object({
    transit_gateway_id             = string
    transit_gateway_route_table_id = string
    region                         = optional(string)
  }))
}
