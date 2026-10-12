variable "networkmanager_connect_peers" {
  description = <<EOT
Map of networkmanager_connect_peers, attributes below
Required:
    - connect_attachment_id
    - peer_address
Optional:
    - core_network_address
    - inside_cidr_blocks
    - subnet_arn
    - tags
    - tags_all
    - bgp_options
EOT

  type = map(object({
    connect_attachment_id = string
    peer_address          = string
    core_network_address  = optional(string)
    inside_cidr_blocks    = optional(list(string))
    subnet_arn            = optional(string)
    tags                  = optional(map(string))
    tags_all              = optional(map(string))
    bgp_options           = optional(list(object({
            peer_asn = optional(string)
        })))
  }))
}
