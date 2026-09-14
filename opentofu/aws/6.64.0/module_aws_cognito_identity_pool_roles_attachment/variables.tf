variable "cognito_identity_pool_roles_attachments" {
  description = <<EOT
Map of cognito_identity_pool_roles_attachments, attributes below
Required:
    - identity_pool_id
    - roles
Optional:
    - region
    - role_mapping
EOT

  type = map(object({
    identity_pool_id = string
    roles            = map(string)
    region           = optional(string)
    role_mapping     = optional(set(object({
            identity_provider         = string
            type                      = string
            ambiguous_role_resolution = optional(string)
            mapping_rule              = optional(list(object({
                claim      = string
                match_type = string
                role_arn   = string
                value      = string
            })))
        })))
  }))
}
