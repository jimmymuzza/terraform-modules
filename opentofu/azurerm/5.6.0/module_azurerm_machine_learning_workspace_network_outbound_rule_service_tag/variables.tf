variable "machine_learning_workspace_network_outbound_rule_service_tags" {
  description = <<EOT
Map of machine_learning_workspace_network_outbound_rule_service_tags, attributes below
Required:
    - name
    - port_ranges
    - protocol
    - service_tag
    - workspace_id
EOT

  type = map(object({
    name         = string
    port_ranges  = string
    protocol     = string
    service_tag  = string
    workspace_id = string
  }))
}
