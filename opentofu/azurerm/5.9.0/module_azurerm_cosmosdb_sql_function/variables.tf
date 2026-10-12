variable "cosmosdb_sql_functions" {
  description = <<EOT
Map of cosmosdb_sql_functions, attributes below
Required:
    - body
    - container_id
    - name
EOT

  type = map(object({
    body         = string
    container_id = string
    name         = string
  }))
}
