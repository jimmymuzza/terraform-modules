variable "postgresql_flexible_server_active_directory_administrators" {
  description = <<EOT
Map of postgresql_flexible_server_active_directory_administrators, attributes below
Required:
    - object_id
    - principal_name
    - principal_type
    - resource_group_name
    - server_name
    - tenant_id
EOT

  type = map(object({
    object_id           = string
    principal_name      = string
    principal_type      = string
    resource_group_name = string
    server_name         = string
    tenant_id           = string
  }))
}
