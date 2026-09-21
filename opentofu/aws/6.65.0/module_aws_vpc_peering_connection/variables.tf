variable "vpc_peering_connections" {
  description = <<EOT
Map of vpc_peering_connections, attributes below
Required:
    - peer_vpc_id
    - vpc_id
Optional:
    - auto_accept
    - peer_owner_id
    - peer_region
    - region
    - tags
    - tags_all
    - accepter
    - requester
EOT

  type = map(object({
    peer_vpc_id   = string
    vpc_id        = string
    auto_accept   = optional(bool)
    peer_owner_id = optional(string)
    peer_region   = optional(string)
    region        = optional(string)
    tags          = optional(map(string))
    tags_all      = optional(map(string))
    accepter      = optional(list(object({
            allow_remote_vpc_dns_resolution = optional(bool)
        })))
    requester     = optional(list(object({
            allow_remote_vpc_dns_resolution = optional(bool)
        })))
  }))
}
