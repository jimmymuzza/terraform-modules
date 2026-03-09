variable "key_vault_managed_storage_accounts" {
  description = <<EOT
Map of key_vault_managed_storage_accounts, attributes below
Required:
    - key_vault_id
    - name
    - storage_account_id
    - storage_account_key
Optional:
    - regenerate_key_automatically
    - regeneration_period
    - tags
EOT

  type = map(object({
    key_vault_id                 = string
    name                         = string
    storage_account_id           = string
    storage_account_key          = string
    regenerate_key_automatically = optional(bool)
    regeneration_period          = optional(string)
    tags                         = optional(map(string))
  }))
}
