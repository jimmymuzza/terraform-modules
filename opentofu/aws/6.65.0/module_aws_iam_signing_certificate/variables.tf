variable "iam_signing_certificates" {
  description = <<EOT
Map of iam_signing_certificates, attributes below
Required:
    - certificate_body
    - user_name
Optional:
    - status
EOT

  type = map(object({
    certificate_body = string
    user_name        = string
    status           = optional(string)
  }))
}
