variable "ec2_transit_gateways" {
  description = <<EOT
Map of ec2_transit_gateways, attributes below
Optional:
    - amazon_side_asn
    - auto_accept_shared_attachments
    - default_route_table_association
    - default_route_table_propagation
    - description
    - dns_support
    - encryption_support
    - multicast_support
    - region
    - security_group_referencing_support
    - tags
    - tags_all
    - transit_gateway_cidr_blocks
    - vpn_ecmp_support
EOT

  type = map(object({
    amazon_side_asn                    = optional(number)
    auto_accept_shared_attachments     = optional(string)
    default_route_table_association    = optional(string)
    default_route_table_propagation    = optional(string)
    description                        = optional(string)
    dns_support                        = optional(string)
    encryption_support                 = optional(string)
    multicast_support                  = optional(string)
    region                             = optional(string)
    security_group_referencing_support = optional(string)
    tags                               = optional(map(string))
    tags_all                           = optional(map(string))
    transit_gateway_cidr_blocks        = optional(set(string))
    vpn_ecmp_support                   = optional(string)
  }))
}
