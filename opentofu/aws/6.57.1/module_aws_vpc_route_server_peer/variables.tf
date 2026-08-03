variable "vpc_route_server_peers" {
  description = <<EOT
Map of vpc_route_server_peers, attributes below
Required:
    - peer_address
    - route_server_endpoint_id
Optional:
    - region
    - tags
    - bgp_options
EOT

  type = map(object({
    peer_address             = string
    route_server_endpoint_id = string
    region                   = optional(string)
    tags                     = optional(map(string))
    bgp_options              = optional(list(object({
            peer_asn                = number
            peer_liveness_detection = optional(string)
        })))
  }))
}
