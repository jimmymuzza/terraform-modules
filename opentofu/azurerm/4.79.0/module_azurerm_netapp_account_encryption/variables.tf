variable "netapp_account_encryptions" {
  description = <<EOT
Map of netapp_account_encryptions, attributes below
Required:
    - encryption_key
    - netapp_account_id
Optional:
    - cross_tenant_key_vault_resource_id
    - federated_client_id
    - system_assigned_identity_principal_id
    - user_assigned_identity_id
EOT

  type = map(object({
    encryption_key                        = string
    netapp_account_id                     = string
    cross_tenant_key_vault_resource_id    = optional(string)
    federated_client_id                   = optional(string)
    system_assigned_identity_principal_id = optional(string)
    user_assigned_identity_id             = optional(string)
  }))
}
