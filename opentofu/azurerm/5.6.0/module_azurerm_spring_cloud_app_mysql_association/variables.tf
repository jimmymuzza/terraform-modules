variable "spring_cloud_app_mysql_associations" {
  description = <<EOT
Map of spring_cloud_app_mysql_associations, attributes below
Required:
    - database_name
    - mysql_server_id
    - name
    - password
    - spring_cloud_app_id
    - username
EOT

  type = map(object({
    database_name       = string
    mysql_server_id     = string
    name                = string
    password            = string
    spring_cloud_app_id = string
    username            = string
  }))
}
