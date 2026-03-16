variable "acmpca_permissions" {
  description = <<EOT
Map of acmpca_permissions, attributes below
Required:
    - actions
    - certificate_authority_arn
    - principal
Optional:
    - region
    - source_account
EOT

  type = map(object({
    actions                   = set(string)
    certificate_authority_arn = string
    principal                 = string
    region                    = optional(string)
    source_account            = optional(string)
  }))
}
