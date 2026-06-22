variable "postgresql_flexible_server_configurations" {
  description = <<EOT
Map of postgresql_flexible_server_configurations, attributes below
Required:
    - name
    - server_id
    - value
EOT

  type = map(object({
    name      = string
    server_id = string
    value     = string
  }))
}
