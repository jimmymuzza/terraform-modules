variable "lighthouse_definitions" {
  description = <<EOT
Map of lighthouse_definitions, attributes below
Required:
    - managing_tenant_id
    - name
    - scope
    - authorization
Optional:
    - description
    - lighthouse_definition_id
    - eligible_authorization
    - plan
EOT

  type = map(object({
    managing_tenant_id       = string
    name                     = string
    scope                    = string
    description              = optional(string)
    lighthouse_definition_id = optional(string)
    authorization            = set(object({
            principal_id                  = string
            role_definition_id            = string
            delegated_role_definition_ids = optional(set(string))
            principal_display_name        = optional(string)
        }))
    eligible_authorization   = optional(set(object({
            principal_id               = string
            role_definition_id         = string
            principal_display_name     = optional(string)
            just_in_time_access_policy = optional(list(object({
                maximum_activation_duration = optional(string)
                multi_factor_auth_provider  = optional(string)
                approver                    = optional(set(object({
                    principal_id           = string
                    principal_display_name = optional(string)
                })))
            })))
        })))
    plan                     = optional(list(object({
            name      = string
            product   = string
            publisher = string
            version   = string
        })))
  }))
}
