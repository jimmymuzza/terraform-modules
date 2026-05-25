variable "ses_domain_mail_froms" {
  description = <<EOT
Map of ses_domain_mail_froms, attributes below
Required:
    - domain
    - mail_from_domain
Optional:
    - behavior_on_mx_failure
    - region
EOT

  type = map(object({
    domain                 = string
    mail_from_domain       = string
    behavior_on_mx_failure = optional(string)
    region                 = optional(string)
  }))
}
