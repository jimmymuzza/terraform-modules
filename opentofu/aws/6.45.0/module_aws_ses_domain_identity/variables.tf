variable "ses_domain_identities" {
  description = <<EOT
Map of ses_domain_identities, attributes below
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
