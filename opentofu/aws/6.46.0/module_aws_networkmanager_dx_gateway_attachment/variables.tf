variable "networkmanager_dx_gateway_attachments" {
  description = <<EOT
Map of networkmanager_dx_gateway_attachments, attributes below
Required:
    - core_network_id
    - direct_connect_gateway_arn
    - edge_locations
Optional:
    - routing_policy_label
    - tags
EOT

  type = map(object({
    core_network_id            = string
    direct_connect_gateway_arn = string
    edge_locations             = list(string)
    routing_policy_label       = optional(string)
    tags                       = optional(map(string))
  }))
}
