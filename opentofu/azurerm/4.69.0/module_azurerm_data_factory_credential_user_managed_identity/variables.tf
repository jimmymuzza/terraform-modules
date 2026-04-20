variable "data_factory_credential_user_managed_identities" {
  description = <<EOT
Map of data_factory_credential_user_managed_identities, attributes below
Required:
    - data_factory_id
    - identity_id
    - name
Optional:
    - annotations
    - description
EOT

  type = map(object({
    data_factory_id = string
    identity_id     = string
    name            = string
    annotations     = optional(list(string))
    description     = optional(string)
  }))
}
