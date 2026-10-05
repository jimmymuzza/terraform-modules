variable "grafana_role_associations" {
  description = <<EOT
Map of grafana_role_associations, attributes below
Required:
    - role
    - workspace_id
Optional:
    - group_ids
    - region
    - user_ids
EOT

  type = map(object({
    role         = string
    workspace_id = string
    group_ids    = optional(set(string))
    region       = optional(string)
    user_ids     = optional(set(string))
  }))
}
