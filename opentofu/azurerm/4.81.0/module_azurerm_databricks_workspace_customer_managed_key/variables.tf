variable "databricks_workspace_customer_managed_keys" {
  description = <<EOT
Map of databricks_workspace_customer_managed_keys, attributes below
Required:
    - key_vault_key_id
    - workspace_id
EOT

  type = map(object({
    key_vault_key_id = string
    workspace_id     = string
  }))
}
