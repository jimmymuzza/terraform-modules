variable "ses_email_identities" {
  description = <<EOT
Map of ses_email_identities, attributes below
Required:
    - email
Optional:
    - region
EOT

  type = map(object({
    email  = string
    region = optional(string)
  }))
}
