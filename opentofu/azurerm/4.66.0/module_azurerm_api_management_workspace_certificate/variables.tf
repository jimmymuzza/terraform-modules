variable "api_management_workspace_certificates" {
  description = <<EOT
Map of api_management_workspace_certificates, attributes below
Required:
    - api_management_workspace_id
    - name
Optional:
    - certificate_data_base64
    - key_vault_secret_id
    - password
    - user_assigned_identity_client_id
EOT

  type = map(object({
    api_management_workspace_id      = string
    name                             = string
    certificate_data_base64          = optional(string)
    key_vault_secret_id              = optional(string)
    password                         = optional(string)
    user_assigned_identity_client_id = optional(string)
  }))
}
