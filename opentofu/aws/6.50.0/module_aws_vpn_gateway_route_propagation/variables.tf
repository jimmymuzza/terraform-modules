variable "vpn_gateway_route_propagations" {
  description = <<EOT
Map of vpn_gateway_route_propagations, attributes below
Required:
    - route_table_id
    - vpn_gateway_id
Optional:
    - region
EOT

  type = map(object({
    route_table_id = string
    vpn_gateway_id = string
    region         = optional(string)
  }))
}
