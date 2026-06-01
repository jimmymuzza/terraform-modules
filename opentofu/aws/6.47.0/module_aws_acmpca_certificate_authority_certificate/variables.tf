variable "acmpca_certificate_authority_certificates" {
  description = <<EOT
Map of acmpca_certificate_authority_certificates, attributes below
Required:
    - certificate
    - certificate_authority_arn
Optional:
    - certificate_chain
    - region
EOT

  type = map(object({
    certificate               = string
    certificate_authority_arn = string
    certificate_chain         = optional(string)
    region                    = optional(string)
  }))
}
