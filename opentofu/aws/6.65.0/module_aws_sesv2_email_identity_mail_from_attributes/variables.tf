variable "sesv2_email_identity_mail_from_attributes" {
  description = <<EOT
Map of sesv2_email_identity_mail_from_attributes, attributes below
Required:
    - email_identity
Optional:
    - behavior_on_mx_failure
    - mail_from_domain
    - region
EOT

  type = map(object({
    email_identity         = string
    behavior_on_mx_failure = optional(string)
    mail_from_domain       = optional(string)
    region                 = optional(string)
  }))
}
