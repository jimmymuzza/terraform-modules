variable "storage_account_customer_managed_keys" {
  description = <<EOT
Map of storage_account_customer_managed_keys, attributes below
Required:
    - key_vault_key_id
    - storage_account_id
Optional:
    - federated_identity_client_id
    - user_assigned_identity_id
EOT

  type = map(object({
    key_vault_key_id             = string
    storage_account_id           = string
    federated_identity_client_id = optional(string)
    user_assigned_identity_id    = optional(string)
  }))
}
