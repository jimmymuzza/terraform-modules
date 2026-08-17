variable "express_route_circuit_connections" {
  description = <<EOT
Map of express_route_circuit_connections, attributes below
Required:
    - address_prefix_ipv4
    - name
    - peer_peering_id
    - peering_id
Optional:
    - address_prefix_ipv6
    - authorization_key
EOT

  type = map(object({
    address_prefix_ipv4 = string
    name                = string
    peer_peering_id     = string
    peering_id          = string
    address_prefix_ipv6 = optional(string)
    authorization_key   = optional(string)
  }))
}
