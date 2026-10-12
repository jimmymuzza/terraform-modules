variable "key_vault_certificate_contacts" {
  description = <<EOT
Map of key_vault_certificate_contacts, attributes below
Required:
    - key_vault_id
    - contact
EOT

  type = map(object({
    key_vault_id = string
    contact      = set(object({
            email = string
            name  = optional(string)
            phone = optional(string)
        }))
  }))
}
