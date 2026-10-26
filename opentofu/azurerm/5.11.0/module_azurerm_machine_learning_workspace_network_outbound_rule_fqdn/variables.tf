variable "machine_learning_workspace_network_outbound_rule_fqdns" {
  description = <<EOT
Map of machine_learning_workspace_network_outbound_rule_fqdns, attributes below
Required:
    - destination_fqdn
    - name
    - workspace_id
EOT

  type = map(object({
    destination_fqdn = string
    name             = string
    workspace_id     = string
  }))
}
