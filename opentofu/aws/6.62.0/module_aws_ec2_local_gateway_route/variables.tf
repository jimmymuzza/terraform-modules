variable "ec2_local_gateway_routes" {
  description = <<EOT
Map of ec2_local_gateway_routes, attributes below
Required:
    - destination_cidr_block
    - local_gateway_route_table_id
    - local_gateway_virtual_interface_group_id
Optional:
    - region
EOT

  type = map(object({
    destination_cidr_block                   = string
    local_gateway_route_table_id             = string
    local_gateway_virtual_interface_group_id = string
    region                                   = optional(string)
  }))
}
