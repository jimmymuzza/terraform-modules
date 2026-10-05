variable "backup_container_storage_accounts" {
  description = <<EOT
Map of backup_container_storage_accounts, attributes below
Required:
    - recovery_vault_name
    - resource_group_name
    - storage_account_id
EOT

  type = map(object({
    recovery_vault_name = string
    resource_group_name = string
    storage_account_id  = string
  }))
}
