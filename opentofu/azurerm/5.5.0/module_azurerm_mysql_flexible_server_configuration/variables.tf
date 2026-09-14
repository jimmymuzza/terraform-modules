variable "mysql_flexible_server_configurations" {
  description = <<EOT
Map of mysql_flexible_server_configurations, attributes below
Required:
    - name
    - resource_group_name
    - server_name
    - value
EOT

  type = map(object({
    name                = string
    resource_group_name = string
    server_name         = string
    value               = string
  }))
}
