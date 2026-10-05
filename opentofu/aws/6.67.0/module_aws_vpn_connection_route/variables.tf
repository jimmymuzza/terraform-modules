variable "vpn_connection_routes" {
  description = <<EOT
Map of vpn_connection_routes, attributes below
Required:
    - destination_cidr_block
    - vpn_connection_id
Optional:
    - region
EOT

  type = map(object({
    destination_cidr_block = string
    vpn_connection_id      = string
    region                 = optional(string)
  }))
}
