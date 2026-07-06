variable "ec2_transit_gateway_routes" {
  description = <<EOT
Map of ec2_transit_gateway_routes, attributes below
Required:
    - destination_cidr_block
    - transit_gateway_route_table_id
Optional:
    - blackhole
    - region
    - transit_gateway_attachment_id
EOT

  type = map(object({
    destination_cidr_block         = string
    transit_gateway_route_table_id = string
    blackhole                      = optional(bool)
    region                         = optional(string)
    transit_gateway_attachment_id  = optional(string)
  }))
}
