variable "cognito_identity_providers" {
  description = <<EOT
Map of cognito_identity_providers, attributes below
Required:
    - provider_details
    - provider_name
    - provider_type
    - user_pool_id
Optional:
    - attribute_mapping
    - idp_identifiers
    - region
EOT

  type = map(object({
    provider_details  = map(string)
    provider_name     = string
    provider_type     = string
    user_pool_id      = string
    attribute_mapping = optional(map(string))
    idp_identifiers   = optional(list(string))
    region            = optional(string)
  }))
}
