variable "sesv2_email_identity_policies" {
  description = <<EOT
Map of sesv2_email_identity_policies, attributes below
Required:
    - email_identity
    - policy
    - policy_name
Optional:
    - region
EOT

  type = map(object({
    email_identity = string
    policy         = string
    policy_name    = string
    region         = optional(string)
  }))
}
