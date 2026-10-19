variable "cosmosdb_sql_stored_procedures" {
  description = <<EOT
Map of cosmosdb_sql_stored_procedures, attributes below
Required:
    - account_name
    - body
    - container_name
    - database_name
    - name
    - resource_group_name
EOT

  type = map(object({
    account_name        = string
    body                = string
    container_name      = string
    database_name       = string
    name                = string
    resource_group_name = string
  }))
}
