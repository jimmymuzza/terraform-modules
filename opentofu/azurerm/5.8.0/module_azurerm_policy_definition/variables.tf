variable "policy_definitions" {
  description = <<EOT
Map of policy_definitions, attributes below
Required:
    - display_name
    - mode
    - name
    - policy_type
Optional:
    - description
    - management_group_id
    - metadata
    - parameters
    - policy_rule
EOT

  type = map(object({
    display_name        = string
    mode                = string
    name                = string
    policy_type         = string
    description         = optional(string)
    management_group_id = optional(string)
    metadata            = optional(string)
    parameters          = optional(string)
    policy_rule         = optional(string)
  }))
}
