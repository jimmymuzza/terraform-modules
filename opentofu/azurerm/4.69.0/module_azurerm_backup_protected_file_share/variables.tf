variable "backup_protected_file_shares" {
  description = <<EOT
Map of backup_protected_file_shares, attributes below
Required:
    - backup_policy_id
    - recovery_vault_name
    - resource_group_name
    - source_file_share_name
    - source_storage_account_id
EOT

  type = map(object({
    backup_policy_id          = string
    recovery_vault_name       = string
    resource_group_name       = string
    source_file_share_name    = string
    source_storage_account_id = string
  }))
}
