variable "key_vault_certificates" {
  description = <<EOT
Map of key_vault_certificates, attributes below
Required:
    - key_vault_id
    - name
Optional:
    - tags
    - certificate
    - certificate_policy
EOT

  type = map(object({
    key_vault_id       = string
    name               = string
    tags               = optional(map(string))
    certificate        = optional(list(object({
            contents = string
            password = optional(string)
        })))
    certificate_policy = optional(list(object({
            issuer_parameters           = list(object({
                name = string
            }))
            key_properties              = list(object({
                exportable = bool
                key_type   = string
                reuse_key  = bool
                curve      = optional(string)
                key_size   = optional(number)
            }))
            lifetime_action             = optional(list(object({
                action  = list(object({
                    action_type = string
                }))
                trigger = list(object({
                    days_before_expiry  = optional(number)
                    lifetime_percentage = optional(number)
                }))
            })))
            secret_properties           = list(object({
                content_type = string
            }))
            x509_certificate_properties = optional(list(object({
                key_usage                 = set(string)
                subject                   = string
                validity_in_months        = number
                extended_key_usage        = optional(list(string))
                subject_alternative_names = optional(list(object({
                    dns_names = optional(set(string))
                    emails    = optional(set(string))
                    upns      = optional(set(string))
                })))
            })))
        })))
  }))
}
