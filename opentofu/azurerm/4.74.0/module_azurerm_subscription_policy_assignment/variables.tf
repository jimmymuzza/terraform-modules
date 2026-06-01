variable "subscription_policy_assignments" {
  description = <<EOT
Map of subscription_policy_assignments, attributes below
Required:
    - name
    - policy_definition_id
    - subscription_id
Optional:
    - description
    - display_name
    - enforce
    - location
    - metadata
    - not_scopes
    - parameters
    - identity
    - non_compliance_message
    - overrides
    - resource_selectors
EOT

  type = map(object({
    name                   = string
    policy_definition_id   = string
    subscription_id        = string
    description            = optional(string)
    display_name           = optional(string)
    enforce                = optional(bool)
    location               = optional(string)
    metadata               = optional(string)
    not_scopes             = optional(list(string))
    parameters             = optional(string)
    identity               = optional(list(object({
            type         = string
            identity_ids = optional(set(string))
        })))
    non_compliance_message = optional(list(object({
            content                        = string
            policy_definition_reference_id = optional(string)
        })))
    overrides              = optional(list(object({
            value     = string
            selectors = optional(list(object({
                in     = optional(list(string))
                kind   = optional(string)
                not_in = optional(list(string))
            })))
        })))
    resource_selectors     = optional(list(object({
            name      = optional(string)
            selectors = list(object({
                kind   = string
                in     = optional(list(string))
                not_in = optional(list(string))
            }))
        })))
  }))
}
