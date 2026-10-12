variable "role_assignments" {
  description = <<EOT
Map of role_assignments, attributes below
Required:
    - principal_id
    - scope
Optional:
    - condition
    - condition_version
    - delegated_managed_identity_resource_id
    - description
    - name
    - principal_type
    - role_definition_id
    - role_definition_name
    - skip_service_principal_aad_check
EOT

  type = map(object({
    principal_id                           = string
    scope                                  = string
    condition                              = optional(string)
    condition_version                      = optional(string)
    delegated_managed_identity_resource_id = optional(string)
    description                            = optional(string)
    name                                   = optional(string)
    principal_type                         = optional(string)
    role_definition_id                     = optional(string)
    role_definition_name                   = optional(string)
    skip_service_principal_aad_check       = optional(bool)
  }))
}
