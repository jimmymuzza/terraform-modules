variable "vpc_route_server_vpc_associations" {
  description = <<EOT
Map of vpc_route_server_vpc_associations, attributes below
Required:
    - route_server_id
    - vpc_id
Optional:
    - region
EOT

  type = map(object({
    route_server_id = string
    vpc_id          = string
    region          = optional(string)
  }))
}
