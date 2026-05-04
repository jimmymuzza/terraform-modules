variable "federated_identity_credentials" {
  description = <<EOT
Map of federated_identity_credentials, attributes below
Required:
    - audience
    - issuer
    - name
    - subject
Optional:
    - parent_id
    - resource_group_name
    - user_assigned_identity_id
EOT

  type = map(object({
    audience                  = list(string)
    issuer                    = string
    name                      = string
    subject                   = string
    parent_id                 = optional(string)
    resource_group_name       = optional(string)
    user_assigned_identity_id = optional(string)
  }))
}
