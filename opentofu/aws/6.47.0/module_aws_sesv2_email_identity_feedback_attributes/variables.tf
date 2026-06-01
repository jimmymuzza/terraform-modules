variable "sesv2_email_identity_feedback_attributes" {
  description = <<EOT
Map of sesv2_email_identity_feedback_attributes, attributes below
Required:
    - email_identity
Optional:
    - email_forwarding_enabled
    - region
EOT

  type = map(object({
    email_identity           = string
    email_forwarding_enabled = optional(bool)
    region                   = optional(string)
  }))
}
