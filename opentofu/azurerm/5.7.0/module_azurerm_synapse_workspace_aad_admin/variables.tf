variable "synapse_workspace_aad_admins" {
  description = <<EOT
Map of synapse_workspace_aad_admins, attributes below
Required:
    - login
    - object_id
    - synapse_workspace_id
    - tenant_id
EOT

  type = map(object({
    login                = string
    object_id            = string
    synapse_workspace_id = string
    tenant_id            = string
  }))
}
