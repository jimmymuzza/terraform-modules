variable "mysql_flexible_databases" {
  description = <<EOT
Map of mysql_flexible_databases, attributes below
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
