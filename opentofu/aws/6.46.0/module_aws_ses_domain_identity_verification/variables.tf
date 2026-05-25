variable "ses_domain_identity_verifications" {
  description = <<EOT
Map of ses_domain_identity_verifications, attributes below
Required:
    - domain
Optional:
    - region
EOT

  type = map(object({
    domain = string
    region = optional(string)
  }))
}
