variable "ec2_local_gateway_route_table_vpc_associations" {
  description = <<EOT
Map of ec2_local_gateway_route_table_vpc_associations, attributes below
Required:
    - local_gateway_route_table_id
    - vpc_id
Optional:
    - region
    - tags
    - tags_all
EOT

  type = map(object({
    local_gateway_route_table_id = string
    vpc_id                       = string
    region                       = optional(string)
    tags                         = optional(map(string))
    tags_all                     = optional(map(string))
  }))
}
