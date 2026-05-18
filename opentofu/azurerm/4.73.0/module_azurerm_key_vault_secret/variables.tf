variable "key_vault_secrets" {
  description = <<EOT
Map of key_vault_secrets, attributes below
Required:
    - key_vault_id
    - name
Optional:
    - content_type
    - expiration_date
    - not_before_date
    - tags
    - value
    - value_wo
    - value_wo_version
EOT

  type = map(object({
    key_vault_id     = string
    name             = string
    content_type     = optional(string)
    expiration_date  = optional(string)
    not_before_date  = optional(string)
    tags             = optional(map(string))
    value            = optional(string)
    value_wo         = optional(string)
    value_wo_version = optional(number)
  }))
}
