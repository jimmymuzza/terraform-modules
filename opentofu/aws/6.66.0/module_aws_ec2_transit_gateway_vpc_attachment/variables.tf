variable "ec2_transit_gateway_vpc_attachments" {
  description = <<EOT
Map of ec2_transit_gateway_vpc_attachments, attributes below
Required:
    - subnet_ids
    - transit_gateway_id
    - vpc_id
Optional:
    - appliance_mode_support
    - dns_support
    - ipv6_support
    - region
    - security_group_referencing_support
    - tags
    - tags_all
    - transit_gateway_default_route_table_association
    - transit_gateway_default_route_table_propagation
EOT

  type = map(object({
    subnet_ids                                      = set(string)
    transit_gateway_id                              = string
    vpc_id                                          = string
    appliance_mode_support                          = optional(string)
    dns_support                                     = optional(string)
    ipv6_support                                    = optional(string)
    region                                          = optional(string)
    security_group_referencing_support              = optional(string)
    tags                                            = optional(map(string))
    tags_all                                        = optional(map(string))
    transit_gateway_default_route_table_association = optional(bool)
    transit_gateway_default_route_table_propagation = optional(bool)
  }))
}
