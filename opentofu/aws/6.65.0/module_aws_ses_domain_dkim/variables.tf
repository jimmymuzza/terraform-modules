variable "ses_domain_dkims" {
  description = <<EOT
Map of ses_domain_dkims, attributes below
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
