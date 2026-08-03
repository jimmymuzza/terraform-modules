variable "ec2_transit_gateway_vpc_attachment_accepters" {
  description = <<EOT
Map of ec2_transit_gateway_vpc_attachment_accepters, attributes below
Required:
    - transit_gateway_attachment_id
Optional:
    - region
    - tags
    - tags_all
    - transit_gateway_default_route_table_association
    - transit_gateway_default_route_table_propagation
EOT

  type = map(object({
    transit_gateway_attachment_id                   = string
    region                                          = optional(string)
    tags                                            = optional(map(string))
    tags_all                                        = optional(map(string))
    transit_gateway_default_route_table_association = optional(bool)
    transit_gateway_default_route_table_propagation = optional(bool)
  }))
}
