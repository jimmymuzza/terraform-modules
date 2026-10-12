variable "policy_set_definitions" {
  description = <<EOT
Map of policy_set_definitions, attributes below
Required:
    - display_name
    - name
    - policy_type
    - policy_definition_reference
Optional:
    - description
    - metadata
    - parameters
    - policy_definition_group
EOT

  type = map(object({
    display_name                = string
    name                        = string
    policy_type                 = string
    description                 = optional(string)
    metadata                    = optional(string)
    parameters                  = optional(string)
    policy_definition_group     = optional(set(object({
            name                            = string
            additional_metadata_resource_id = optional(string)
            category                        = optional(string)
            description                     = optional(string)
            display_name                    = optional(string)
        })))
    policy_definition_reference = list(object({
            policy_definition_id = string
            parameter_values     = optional(string)
            policy_group_names   = optional(set(string))
            reference_id         = optional(string)
            version              = optional(string)
        }))
  }))
}
