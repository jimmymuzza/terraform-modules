variable "application_federated_identity_credentials" {
  description = <<EOT
Map of application_federated_identity_credentials, attributes below
Required:
    - application_id
    - audiences
    - display_name
    - issuer
    - subject
Optional:
    - description
EOT

  type = map(object({
    application_id = string
    audiences      = list(string)
    display_name   = string
    issuer         = string
    subject        = string
    description    = optional(string)
  }))
}
