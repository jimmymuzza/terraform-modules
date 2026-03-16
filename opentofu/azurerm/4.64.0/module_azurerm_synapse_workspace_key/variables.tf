variable "synapse_workspace_keys" {
  description = <<EOT
Map of synapse_workspace_keys, attributes below
Required:
    - active
    - customer_managed_key_name
    - synapse_workspace_id
Optional:
    - customer_managed_key_versionless_id
EOT

  type = map(object({
    active                              = bool
    customer_managed_key_name           = string
    synapse_workspace_id                = string
    customer_managed_key_versionless_id = optional(string)
  }))
}
