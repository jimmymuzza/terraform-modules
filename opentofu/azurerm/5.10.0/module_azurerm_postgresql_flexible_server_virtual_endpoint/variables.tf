variable "postgresql_flexible_server_virtual_endpoints" {
  description = <<EOT
Map of postgresql_flexible_server_virtual_endpoints, attributes below
Required:
    - name
    - replica_server_id
    - source_server_id
    - type
EOT

  type = map(object({
    name              = string
    replica_server_id = string
    source_server_id  = string
    type              = string
  }))
}
