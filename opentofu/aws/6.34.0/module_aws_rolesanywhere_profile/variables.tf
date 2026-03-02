variable "rolesanywhere_profiles" {
  description = <<EOT
Map of rolesanywhere_profiles, attributes below
Required:
    - name
Optional:
    - accept_role_session_name
    - duration_seconds
    - enabled
    - managed_policy_arns
    - require_instance_properties
    - role_arns
    - session_policy
    - tags
    - tags_all
EOT

  type = map(object({
    name                        = string
    accept_role_session_name    = optional(bool)
    duration_seconds            = optional(number)
    enabled                     = optional(bool)
    managed_policy_arns         = optional(set(string))
    require_instance_properties = optional(bool)
    role_arns                   = optional(set(string))
    session_policy              = optional(string)
    tags                        = optional(map(string))
    tags_all                    = optional(map(string))
  }))
}
