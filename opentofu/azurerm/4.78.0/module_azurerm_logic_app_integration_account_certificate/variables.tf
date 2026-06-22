variable "logic_app_integration_account_certificates" {
  description = <<EOT
Map of logic_app_integration_account_certificates, attributes below
Required:
    - integration_account_name
    - name
    - resource_group_name
Optional:
    - metadata
    - public_certificate
    - key_vault_key
EOT

  type = map(object({
    integration_account_name = string
    name                     = string
    resource_group_name      = string
    metadata                 = optional(string)
    public_certificate       = optional(string)
    key_vault_key            = optional(list(object({
            key_name     = string
            key_vault_id = string
            key_version  = optional(string)
        })))
  }))
}
