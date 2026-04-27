variable "mysql_flexible_server_active_directory_administrators" {
  description = <<EOT
Map of mysql_flexible_server_active_directory_administrators, attributes below
Required:
    - identity_id
    - login
    - object_id
    - server_id
    - tenant_id
EOT

  type = map(object({
    identity_id = string
    login       = string
    object_id   = string
    server_id   = string
    tenant_id   = string
  }))
}
