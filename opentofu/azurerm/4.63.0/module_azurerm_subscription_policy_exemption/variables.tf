variable "subscription_policy_exemptions" {
  description = <<EOT
Map of subscription_policy_exemptions, attributes below
Required:
    - exemption_category
    - name
    - policy_assignment_id
    - subscription_id
Optional:
    - description
    - display_name
    - expires_on
    - metadata
    - policy_definition_reference_ids
EOT

  type = map(object({
    exemption_category              = string
    name                            = string
    policy_assignment_id            = string
    subscription_id                 = string
    description                     = optional(string)
    display_name                    = optional(string)
    expires_on                      = optional(string)
    metadata                        = optional(string)
    policy_definition_reference_ids = optional(list(string))
  }))
}
