variable "iam_roles" {
  description = <<EOT
Map of iam_roles, attributes below
Required:
    - assume_role_policy
Optional:
    - description
    - force_detach_policies
    - managed_policy_arns
    - max_session_duration
    - name
    - name_prefix
    - path
    - permissions_boundary
    - tags
    - tags_all
    - inline_policy
EOT

  type = map(object({
    assume_role_policy    = string
    description           = optional(string)
    force_detach_policies = optional(bool)
    managed_policy_arns   = optional(set(string))
    max_session_duration  = optional(number)
    name                  = optional(string)
    name_prefix           = optional(string)
    path                  = optional(string)
    permissions_boundary  = optional(string)
    tags                  = optional(map(string))
    tags_all              = optional(map(string))
    inline_policy         = optional(set(object({
            name   = optional(string)
            policy = optional(string)
        })))
  }))
}
