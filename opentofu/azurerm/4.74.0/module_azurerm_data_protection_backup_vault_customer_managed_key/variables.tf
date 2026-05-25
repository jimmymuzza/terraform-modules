variable "data_protection_backup_vault_customer_managed_keys" {
  description = <<EOT
Map of data_protection_backup_vault_customer_managed_keys, attributes below
Required:
    - data_protection_backup_vault_id
    - key_vault_key_id
EOT

  type = map(object({
    data_protection_backup_vault_id = string
    key_vault_key_id                = string
  }))
}
