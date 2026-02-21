variable "ses_identity_policies" {
  description = <<EOT
Map of ses_identity_policies, attributes below
Required:
    - identity
    - name
    - policy
Optional:
    - region
EOT

  type = map(object({
    identity = string
    name     = string
    policy   = string
    region   = optional(string)
  }))
}
