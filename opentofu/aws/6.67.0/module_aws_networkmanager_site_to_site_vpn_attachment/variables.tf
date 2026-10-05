variable "networkmanager_site_to_site_vpn_attachments" {
  description = <<EOT
Map of networkmanager_site_to_site_vpn_attachments, attributes below
Required:
    - core_network_id
    - vpn_connection_arn
Optional:
    - routing_policy_label
    - tags
    - tags_all
EOT

  type = map(object({
    core_network_id      = string
    vpn_connection_arn   = string
    routing_policy_label = optional(string)
    tags                 = optional(map(string))
    tags_all             = optional(map(string))
  }))
}
