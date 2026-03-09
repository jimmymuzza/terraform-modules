variable "postgresql_flexible_server_backups" {
  description = <<EOT
Map of postgresql_flexible_server_backups, attributes below
Required:
    - name
    - server_id
EOT

  type = map(object({
    name      = string
    server_id = string
  }))
}
