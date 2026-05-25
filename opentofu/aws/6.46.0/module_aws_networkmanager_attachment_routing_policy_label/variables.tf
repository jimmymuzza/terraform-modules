variable "networkmanager_attachment_routing_policy_labels" {
  description = <<EOT
Map of networkmanager_attachment_routing_policy_labels, attributes below
Required:
    - attachment_id
    - core_network_id
    - routing_policy_label
EOT

  type = map(object({
    attachment_id        = string
    core_network_id      = string
    routing_policy_label = string
  }))
}
