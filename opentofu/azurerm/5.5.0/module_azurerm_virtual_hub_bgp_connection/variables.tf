variable "virtual_hub_bgp_connections" {
  description = <<EOT
Map of virtual_hub_bgp_connections, attributes below
Required:
    - name
    - peer_asn
    - peer_ip
    - virtual_hub_id
Optional:
    - virtual_network_connection_id
EOT

  type = map(object({
    name                          = string
    peer_asn                      = number
    peer_ip                       = string
    virtual_hub_id                = string
    virtual_network_connection_id = optional(string)
  }))
}
