variable "databricks_workspace_root_dbfs_customer_managed_keys" {
  description = <<EOT
Map of databricks_workspace_root_dbfs_customer_managed_keys, attributes below
Required:
    - key_vault_key_id
    - workspace_id
Optional:
    - key_vault_id
EOT

  type = map(object({
    key_vault_key_id = string
    workspace_id     = string
    key_vault_id     = optional(string)
  }))
}
