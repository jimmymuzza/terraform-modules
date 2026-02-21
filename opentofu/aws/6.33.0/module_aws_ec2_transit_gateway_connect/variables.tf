variable "ec2_transit_gateway_connects" {
  description = <<EOT
Map of ec2_transit_gateway_connects, attributes below
Required:
    - transit_gateway_id
    - transport_attachment_id
Optional:
    - protocol
    - region
    - tags
    - tags_all
    - transit_gateway_default_route_table_association
    - transit_gateway_default_route_table_propagation
EOT

  type = map(object({
    transit_gateway_id                              = string
    transport_attachment_id                         = string
    protocol                                        = optional(string)
    region                                          = optional(string)
    tags                                            = optional(map(string))
    tags_all                                        = optional(map(string))
    transit_gateway_default_route_table_association = optional(bool)
    transit_gateway_default_route_table_propagation = optional(bool)
  }))
}
