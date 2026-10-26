variable "cognito_identity_pool_provider_principal_tags" {
  description = <<EOT
Map of cognito_identity_pool_provider_principal_tags, attributes below
Required:
    - identity_pool_id
    - identity_provider_name
Optional:
    - principal_tags
    - region
    - use_defaults
EOT

  type = map(object({
    identity_pool_id       = string
    identity_provider_name = string
    principal_tags         = optional(map(string))
    region                 = optional(string)
    use_defaults           = optional(bool)
  }))
}
