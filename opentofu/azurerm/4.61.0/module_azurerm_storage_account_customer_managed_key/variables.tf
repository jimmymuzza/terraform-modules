variable "storage_account_customer_managed_keys" {
  description = <<EOT
Map of storage_account_customer_managed_keys, attributes below
Required:
    - storage_account_id
Optional:
    - federated_identity_client_id
    - key_name
    - key_vault_id
    - key_vault_key_id
    - key_vault_uri
    - key_version
    - managed_hsm_key_id
    - user_assigned_identity_id
EOT

  type = map(object({
    storage_account_id           = string
    federated_identity_client_id = optional(string)
    key_name                     = optional(string)
    key_vault_id                 = optional(string)
    key_vault_key_id             = optional(string)
    key_vault_uri                = optional(string)
    key_version                  = optional(string)
    managed_hsm_key_id           = optional(string)
    user_assigned_identity_id    = optional(string)
  }))
}
