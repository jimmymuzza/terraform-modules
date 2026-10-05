variable "eventhub_namespace_customer_managed_keys" {
  description = <<EOT
Map of eventhub_namespace_customer_managed_keys, attributes below
Required:
    - eventhub_namespace_id
    - key_vault_key_ids
Optional:
    - infrastructure_encryption_enabled
    - user_assigned_identity_id
EOT

  type = map(object({
    eventhub_namespace_id             = string
    key_vault_key_ids                 = set(string)
    infrastructure_encryption_enabled = optional(bool)
    user_assigned_identity_id         = optional(string)
  }))
}
