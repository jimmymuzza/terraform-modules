variable "postgresql_active_directory_administrators" {
  description = <<EOT
Map of postgresql_active_directory_administrators, attributes below
Required:
    - login
    - object_id
    - resource_group_name
    - server_name
    - tenant_id
EOT

  type = map(object({
    login               = string
    object_id           = string
    resource_group_name = string
    server_name         = string
    tenant_id           = string
  }))
}
