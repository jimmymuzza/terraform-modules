variable "synapse_integration_runtime_self_hosteds" {
  description = <<EOT
Map of synapse_integration_runtime_self_hosteds, attributes below
Required:
    - name
    - synapse_workspace_id
Optional:
    - description
EOT

  type = map(object({
    name                 = string
    synapse_workspace_id = string
    description          = optional(string)
  }))
}
