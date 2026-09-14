variable "vpc_endpoint_route_table_associations" {
  description = <<EOT
Map of vpc_endpoint_route_table_associations, attributes below
Required:
    - route_table_id
    - vpc_endpoint_id
Optional:
    - region
EOT

  type = map(object({
    route_table_id  = string
    vpc_endpoint_id = string
    region          = optional(string)
  }))
}
