variable "key_vault_certificate_contacts" {
  description = <<EOT
Map of key_vault_certificate_contacts, attributes below
Required:
    - key_vault_id
Optional:
    - contact
EOT

  type = map(object({
    key_vault_id = string
    contact      = optional(set(object({
            email = string
            name  = optional(string)
            phone = optional(string)
        })))
  }))
}
