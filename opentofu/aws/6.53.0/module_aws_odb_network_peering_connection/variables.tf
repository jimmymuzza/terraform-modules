variable "odb_network_peering_connections" {
  description = <<EOT
Map of odb_network_peering_connections, attributes below
Required:
    - display_name
    - peer_network_id
Optional:
    - odb_network_arn
    - odb_network_id
    - peer_network_cidrs
    - region
    - tags
EOT

  type = map(object({
    display_name       = string
    peer_network_id    = string
    odb_network_arn    = optional(string)
    odb_network_id     = optional(string)
    peer_network_cidrs = optional(set(string))
    region             = optional(string)
    tags               = optional(map(string))
  }))
}
