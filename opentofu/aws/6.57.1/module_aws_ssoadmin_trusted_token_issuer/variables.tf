variable "ssoadmin_trusted_token_issuers" {
  description = <<EOT
Map of ssoadmin_trusted_token_issuers, attributes below
Required:
    - instance_arn
    - name
    - trusted_token_issuer_type
Optional:
    - client_token
    - region
    - tags
    - trusted_token_issuer_configuration
EOT

  type = map(object({
    instance_arn                       = string
    name                               = string
    trusted_token_issuer_type          = string
    client_token                       = optional(string)
    region                             = optional(string)
    tags                               = optional(map(string))
    trusted_token_issuer_configuration = optional(list(object({
            oidc_jwt_configuration = optional(list(object({
                claim_attribute_path          = string
                identity_store_attribute_path = string
                issuer_url                    = string
                jwks_retrieval_option         = string
            })))
        })))
  }))
}
