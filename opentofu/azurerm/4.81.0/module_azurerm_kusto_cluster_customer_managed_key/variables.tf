variable "kusto_cluster_customer_managed_keys" {
  description = <<EOT
Map of kusto_cluster_customer_managed_keys, attributes below
Required:
    - cluster_id
Optional:
    - key_name
    - key_vault_id
    - key_version
    - managed_hsm_key_id
    - user_identity
EOT

  type = map(object({
    cluster_id         = string
    key_name           = optional(string)
    key_vault_id       = optional(string)
    key_version        = optional(string)
    managed_hsm_key_id = optional(string)
    user_identity      = optional(string)
  }))
}
