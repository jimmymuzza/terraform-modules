variable "cognitive_account_customer_managed_keys" {
  description = <<EOT
Map of cognitive_account_customer_managed_keys, attributes below
Required:
    - cognitive_account_id
    - key_vault_key_id
Optional:
    - identity_client_id
EOT

  type = map(object({
    cognitive_account_id = string
    key_vault_key_id     = string
    identity_client_id   = optional(string)
  }))
}
