variable "ec2_local_gateway_route_table_virtual_interface_group_associations" {
  description = <<EOT
Map of ec2_local_gateway_route_table_virtual_interface_group_associations, attributes below
Required:
    - local_gateway_route_table_id
    - local_gateway_virtual_interface_group_id
Optional:
    - region
    - tags
EOT

  type = map(object({
    local_gateway_route_table_id             = string
    local_gateway_virtual_interface_group_id = string
    region                                   = optional(string)
    tags                                     = optional(map(string))
  }))
}
