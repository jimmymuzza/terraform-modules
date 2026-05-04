variable "ec2_transit_gateway_multicast_domain_associations" {
  description = <<EOT
Map of ec2_transit_gateway_multicast_domain_associations, attributes below
Required:
    - subnet_id
    - transit_gateway_attachment_id
    - transit_gateway_multicast_domain_id
Optional:
    - region
EOT

  type = map(object({
    subnet_id                           = string
    transit_gateway_attachment_id       = string
    transit_gateway_multicast_domain_id = string
    region                              = optional(string)
  }))
}
