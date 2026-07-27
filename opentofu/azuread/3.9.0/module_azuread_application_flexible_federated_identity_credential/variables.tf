variable "application_flexible_federated_identity_credentials" {
  description = <<EOT
Map of application_flexible_federated_identity_credentials, attributes below
Required:
    - application_id
    - audience
    - claims_matching_expression
    - display_name
    - issuer
Optional:
    - description
EOT

  type = map(object({
    application_id             = string
    audience                   = string
    claims_matching_expression = string
    display_name               = string
    issuer                     = string
    description                = optional(string)
  }))
}
