variable "postgresql_databases" {
  description = <<EOT
Map of postgresql_databases, attributes below
Required:
    - charset
    - collation
    - name
    - resource_group_name
    - server_name
EOT

  type = map(object({
    charset             = string
    collation           = string
    name                = string
    resource_group_name = string
    server_name         = string
  }))
}
