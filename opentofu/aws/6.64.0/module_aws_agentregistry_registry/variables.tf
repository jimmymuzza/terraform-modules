variable "agentregistry_registries" {
  description = <<EOT
Map of agentregistry_registries, attributes below
Required:
    - name
Optional:
    - description
    - region
    - tags
    - approval_configuration
    - discovery_configuration
EOT

  type = map(object({
    name                    = string
    description             = optional(string)
    region                  = optional(string)
    tags                    = optional(map(string))
    approval_configuration  = optional(list(object({
            auto_approval_rules = optional(set(string))
        })))
    discovery_configuration = optional(list(object({
            authorizer_type          = string
            authorizer_configuration = optional(list(object({
                custom_jwt_authorizer = optional(list(object({
                    discovery_url    = string
                    allowed_audience = optional(list(string))
                    allowed_clients  = optional(list(string))
                    allowed_scopes   = optional(list(string))
                    custom_claim     = optional(set(object({
                        inbound_token_claim_name       = string
                        inbound_token_claim_value_type = string
                        authorizing_claim_match_value  = optional(list(object({
                            claim_match_operator = string
                            claim_match_value    = optional(list(object({
                                match_value_string      = optional(string)
                                match_value_string_list = optional(set(string))
                            })))
                        })))
                    })))
                })))
            })))
        })))
  }))
}
