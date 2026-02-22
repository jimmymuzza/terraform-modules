variable "app_role_assignments" {
  description = <<EOT
Map of app_role_assignments, attributes below
Required:
    - app_role_id
    - principal_object_id
    - resource_object_id
EOT

  type = map(object({
    app_role_id         = string
    principal_object_id = string
    resource_object_id  = string
  }))
}
