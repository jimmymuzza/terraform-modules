variable "machine_learning_workspace_network_outbound_rule_private_endpoints" {
  description = <<EOT
Map of machine_learning_workspace_network_outbound_rule_private_endpoints, attributes below
Required:
    - name
    - service_resource_id
    - sub_resource_target
    - workspace_id
Optional:
    - spark_enabled
EOT

  type = map(object({
    name                = string
    service_resource_id = string
    sub_resource_target = string
    workspace_id        = string
    spark_enabled       = optional(bool)
  }))
}
