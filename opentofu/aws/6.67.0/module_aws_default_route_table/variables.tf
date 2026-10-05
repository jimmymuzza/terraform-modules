variable "default_route_tables" {
  description = <<EOT
Map of default_route_tables, attributes below
Required:
    - default_route_table_id
Optional:
    - propagating_vgws
    - region
    - route
    - tags
    - tags_all
EOT

  type = map(object({
    default_route_table_id = string
    propagating_vgws       = optional(set(string))
    region                 = optional(string)
    route                  = optional(set(object({
            cidr_block = string
            core_network_arn = string
            destination_prefix_list_id = string
            egress_only_gateway_id = string
            gateway_id = string
            instance_id = string
            ipv6_cidr_block = string
            nat_gateway_id = string
            network_interface_id = string
            transit_gateway_id = string
            vpc_endpoint_id = string
            vpc_peering_connection_id = string
        })))
    tags                   = optional(map(string))
    tags_all               = optional(map(string))
  }))
}
