variable "ec2_transit_gateway_connect_peers" {
  description = <<EOT
Map of ec2_transit_gateway_connect_peers, attributes below
Required:
    - inside_cidr_blocks
    - peer_address
    - transit_gateway_attachment_id
Optional:
    - bgp_asn
    - region
    - tags
    - tags_all
    - transit_gateway_address
EOT

  type = map(object({
    inside_cidr_blocks            = set(string)
    peer_address                  = string
    transit_gateway_attachment_id = string
    bgp_asn                       = optional(string)
    region                        = optional(string)
    tags                          = optional(map(string))
    tags_all                      = optional(map(string))
    transit_gateway_address       = optional(string)
  }))
}
