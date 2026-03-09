variable "routes" {
  description = <<EOT
Map of routes, attributes below
Required:
    - route_table_id
Optional:
    - carrier_gateway_id
    - core_network_arn
    - destination_cidr_block
    - destination_ipv6_cidr_block
    - destination_prefix_list_id
    - egress_only_gateway_id
    - gateway_id
    - local_gateway_id
    - nat_gateway_id
    - network_interface_id
    - region
    - transit_gateway_id
    - vpc_endpoint_id
    - vpc_peering_connection_id
EOT

  type = map(object({
    route_table_id              = string
    carrier_gateway_id          = optional(string)
    core_network_arn            = optional(string)
    destination_cidr_block      = optional(string)
    destination_ipv6_cidr_block = optional(string)
    destination_prefix_list_id  = optional(string)
    egress_only_gateway_id      = optional(string)
    gateway_id                  = optional(string)
    local_gateway_id            = optional(string)
    nat_gateway_id              = optional(string)
    network_interface_id        = optional(string)
    region                      = optional(string)
    transit_gateway_id          = optional(string)
    vpc_endpoint_id             = optional(string)
    vpc_peering_connection_id   = optional(string)
  }))
}
