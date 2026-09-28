variable "directory_role_assignments" {
  description = <<EOT
Map of directory_role_assignments, attributes below
Required:
    - principal_object_id
    - role_id
Optional:
    - app_scope_id
    - directory_scope_id
EOT

  type = map(object({
    principal_object_id = string
    role_id             = string
    app_scope_id        = optional(string)
    directory_scope_id  = optional(string)
  }))
}
