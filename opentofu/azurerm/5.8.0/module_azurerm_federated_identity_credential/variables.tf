variable "federated_identity_credentials" {
  description = <<EOT
Map of federated_identity_credentials, attributes below
Required:
    - audience
    - issuer
    - name
    - subject
    - user_assigned_identity_id
EOT

  type = map(object({
    audience                  = list(string)
    issuer                    = string
    name                      = string
    subject                   = string
    user_assigned_identity_id = string
  }))
}
