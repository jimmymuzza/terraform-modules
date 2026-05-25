variable "config_organization_managed_rules" {
  description = <<EOT
Map of config_organization_managed_rules, attributes below
Required:
    - name
    - rule_identifier
Optional:
    - description
    - excluded_accounts
    - input_parameters
    - maximum_execution_frequency
    - region
    - resource_id_scope
    - resource_types_scope
    - tag_key_scope
    - tag_value_scope
EOT

  type = map(object({
    name                        = string
    rule_identifier             = string
    description                 = optional(string)
    excluded_accounts           = optional(set(string))
    input_parameters            = optional(string)
    maximum_execution_frequency = optional(string)
    region                      = optional(string)
    resource_id_scope           = optional(string)
    resource_types_scope        = optional(set(string))
    tag_key_scope               = optional(string)
    tag_value_scope             = optional(string)
  }))
}
