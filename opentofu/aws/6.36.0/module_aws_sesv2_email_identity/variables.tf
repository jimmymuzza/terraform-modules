variable "sesv2_email_identities" {
  description = <<EOT
Map of sesv2_email_identities, attributes below
Required:
    - email_identity
Optional:
    - configuration_set_name
    - region
    - tags
    - tags_all
    - dkim_signing_attributes
EOT

  type = map(object({
    email_identity          = string
    configuration_set_name  = optional(string)
    region                  = optional(string)
    tags                    = optional(map(string))
    tags_all                = optional(map(string))
    dkim_signing_attributes = optional(list(object({
            domain_signing_private_key = optional(string)
            domain_signing_selector    = optional(string)
            next_signing_key_length    = optional(string)
        })))
  }))
}
