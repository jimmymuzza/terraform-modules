variable "management_group_policy_exemptions" {
  description = <<EOT
Map of management_group_policy_exemptions, attributes below
Required:
    - exemption_category
    - management_group_id
    - name
    - policy_assignment_id
Optional:
    - description
    - display_name
    - expires_on
    - metadata
    - policy_definition_reference_ids
EOT

  type = map(object({
    exemption_category              = string
    management_group_id             = string
    name                            = string
    policy_assignment_id            = string
    description                     = optional(string)
    display_name                    = optional(string)
    expires_on                      = optional(string)
    metadata                        = optional(string)
    policy_definition_reference_ids = optional(list(string))
  }))
}
