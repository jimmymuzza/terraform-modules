variable "cognito_identity_pools" {
  description = <<EOT
Map of cognito_identity_pools, attributes below
Required:
    - identity_pool_name
Optional:
    - allow_classic_flow
    - allow_unauthenticated_identities
    - developer_provider_name
    - openid_connect_provider_arns
    - region
    - saml_provider_arns
    - supported_login_providers
    - tags
    - tags_all
    - cognito_identity_providers
EOT

  type = map(object({
    identity_pool_name               = string
    allow_classic_flow               = optional(bool)
    allow_unauthenticated_identities = optional(bool)
    developer_provider_name          = optional(string)
    openid_connect_provider_arns     = optional(set(string))
    region                           = optional(string)
    saml_provider_arns               = optional(list(string))
    supported_login_providers        = optional(map(string))
    tags                             = optional(map(string))
    tags_all                         = optional(map(string))
    cognito_identity_providers       = optional(set(object({
            client_id               = optional(string)
            provider_name           = optional(string)
            server_side_token_check = optional(bool)
        })))
  }))
}
