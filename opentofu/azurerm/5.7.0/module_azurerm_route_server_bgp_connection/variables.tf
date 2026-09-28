variable "route_server_bgp_connections" {
  description = <<EOT
Map of route_server_bgp_connections, attributes below
Required:
    - name
    - peer_asn
    - peer_ip
    - route_server_id
EOT

  type = map(object({
    name            = string
    peer_asn        = number
    peer_ip         = string
    route_server_id = string
  }))
}
