variable "servicebus_namespace_customer_managed_keys" {
  description = <<EOT
Map of servicebus_namespace_customer_managed_keys, attributes below
Required:
    - key_vault_key_id
    - namespace_id
Optional:
    - infrastructure_encryption_enabled
EOT

  type = map(object({
    key_vault_key_id                  = string
    namespace_id                      = string
    infrastructure_encryption_enabled = optional(bool)
  }))
}
