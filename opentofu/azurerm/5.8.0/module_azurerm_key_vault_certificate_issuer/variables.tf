variable "key_vault_certificate_issuers" {
  description = <<EOT
Map of key_vault_certificate_issuers, attributes below
Required:
    - key_vault_id
    - name
    - provider_name
Optional:
    - account_id
    - org_id
    - password
    - admin
EOT

  type = map(object({
    key_vault_id  = string
    name          = string
    provider_name = string
    account_id    = optional(string)
    org_id        = optional(string)
    password      = optional(string)
    admin         = optional(list(object({
            email_address = string
            first_name    = optional(string)
            last_name     = optional(string)
            phone         = optional(string)
        })))
  }))
}
