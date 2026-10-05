variable "api_management_certificates" {
  description = <<EOT
Map of api_management_certificates, attributes below
Required:
    - api_management_name
    - name
    - resource_group_name
Optional:
    - data
    - key_vault_identity_client_id
    - key_vault_secret_id
    - password
EOT

  type = map(object({
    api_management_name          = string
    name                         = string
    resource_group_name          = string
    data                         = optional(string)
    key_vault_identity_client_id = optional(string)
    key_vault_secret_id          = optional(string)
    password                     = optional(string)
  }))
}
