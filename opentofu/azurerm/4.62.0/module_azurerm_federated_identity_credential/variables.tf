variable "federated_identity_credentials" {
  description = <<EOT
Map of federated_identity_credentials, attributes below
Required:
    - audience
    - issuer
    - name
    - parent_id
    - subject
Optional:
    - resource_group_name
EOT

  type = map(object({
    audience            = list(string)
    issuer              = string
    name                = string
    parent_id           = string
    subject             = string
    resource_group_name = optional(string)
  }))
}
