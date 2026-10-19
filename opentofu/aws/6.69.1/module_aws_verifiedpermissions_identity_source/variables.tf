variable "verifiedpermissions_identity_sources" {
  description = <<EOT
Map of verifiedpermissions_identity_sources, attributes below
Required:
    - policy_store_id
Optional:
    - principal_entity_type
    - region
    - configuration
EOT

  type = map(object({
    policy_store_id       = string
    principal_entity_type = optional(string)
    region                = optional(string)
    configuration         = optional(list(object({
            cognito_user_pool_configuration = optional(list(object({
                user_pool_arn       = string
                client_ids          = optional(list(string))
                group_configuration = optional(list(object({
                    group_entity_type = string
                })))
            })))
            open_id_connect_configuration   = optional(list(object({
                issuer              = string
                entity_id_prefix    = optional(string)
                group_configuration = optional(list(object({
                    group_claim       = string
                    group_entity_type = string
                })))
                token_selection     = optional(list(object({
                    access_token_only   = optional(list(object({
                        audiences          = optional(list(string))
                        principal_id_claim = optional(string)
                    })))
                    identity_token_only = optional(list(object({
                        client_ids         = optional(list(string))
                        principal_id_claim = optional(string)
                    })))
                })))
            })))
        })))
  }))
}
