variable "ec2_transit_gateway_multicast_group_sources" {
  description = <<EOT
Map of ec2_transit_gateway_multicast_group_sources, attributes below
Required:
    - group_ip_address
    - network_interface_id
    - transit_gateway_multicast_domain_id
Optional:
    - region
EOT

  type = map(object({
    group_ip_address                    = string
    network_interface_id                = string
    transit_gateway_multicast_domain_id = string
    region                              = optional(string)
  }))
}
