variable "eks_identity_provider_configs" {
  description = <<EOT
Map of eks_identity_provider_configs, attributes below
Required:
    - cluster_name
    - oidc
Optional:
    - region
    - tags
    - tags_all
EOT

  type = map(object({
    cluster_name = string
    region       = optional(string)
    tags         = optional(map(string))
    tags_all     = optional(map(string))
    oidc         = list(object({
            client_id                     = string
            identity_provider_config_name = string
            issuer_url                    = string
            groups_claim                  = optional(string)
            groups_prefix                 = optional(string)
            required_claims               = optional(map(string))
            username_claim                = optional(string)
            username_prefix               = optional(string)
        }))
  }))
}
