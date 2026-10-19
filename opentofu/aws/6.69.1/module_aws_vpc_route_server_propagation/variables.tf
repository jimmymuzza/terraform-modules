variable "vpc_route_server_propagations" {
  description = <<EOT
Map of vpc_route_server_propagations, attributes below
Required:
    - route_server_id
    - route_table_id
Optional:
    - region
EOT

  type = map(object({
    route_server_id = string
    route_table_id  = string
    region          = optional(string)
  }))
}
