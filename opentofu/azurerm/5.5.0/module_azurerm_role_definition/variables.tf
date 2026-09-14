variable "role_definitions" {
  description = <<EOT
Map of role_definitions, attributes below
Required:
    - name
    - scope
Optional:
    - assignable_scopes
    - description
    - role_definition_id
    - permissions
EOT

  type = map(object({
    name               = string
    scope              = string
    assignable_scopes  = optional(list(string))
    description        = optional(string)
    role_definition_id = optional(string)
    permissions        = optional(list(object({
            actions          = optional(list(string))
            data_actions     = optional(set(string))
            not_actions      = optional(list(string))
            not_data_actions = optional(set(string))
        })))
  }))
}
