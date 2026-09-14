variable "kusto_cosmosdb_data_connections" {
  description = <<EOT
Map of kusto_cosmosdb_data_connections, attributes below
Required:
    - cosmosdb_container_id
    - kusto_database_id
    - location
    - managed_identity_id
    - name
    - table_name
Optional:
    - mapping_rule_name
    - retrieval_start_date
EOT

  type = map(object({
    cosmosdb_container_id = string
    kusto_database_id     = string
    location              = string
    managed_identity_id   = string
    name                  = string
    table_name            = string
    mapping_rule_name     = optional(string)
    retrieval_start_date  = optional(string)
  }))
}
