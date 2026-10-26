variable "virtual_hub_route_table_routes" {
  description = <<EOT
Map of virtual_hub_route_table_routes, attributes below
Required:
    - destinations
    - destinations_type
    - name
    - next_hop
    - route_table_id
Optional:
    - next_hop_type
EOT

  type = map(object({
    destinations      = set(string)
    destinations_type = string
    name              = string
    next_hop          = string
    route_table_id    = string
    next_hop_type     = optional(string)
  }))
}
