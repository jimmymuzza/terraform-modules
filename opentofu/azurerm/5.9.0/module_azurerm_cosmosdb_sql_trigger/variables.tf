variable "cosmosdb_sql_triggers" {
  description = <<EOT
Map of cosmosdb_sql_triggers, attributes below
Required:
    - body
    - container_id
    - name
    - operation
    - type
EOT

  type = map(object({
    body         = string
    container_id = string
    name         = string
    operation    = string
    type         = string
  }))
}
