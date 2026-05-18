variable "spring_cloud_app_cosmosdb_associations" {
  description = <<EOT
Map of spring_cloud_app_cosmosdb_associations, attributes below
Required:
    - api_type
    - cosmosdb_access_key
    - cosmosdb_account_id
    - name
    - spring_cloud_app_id
Optional:
    - cosmosdb_cassandra_keyspace_name
    - cosmosdb_gremlin_database_name
    - cosmosdb_gremlin_graph_name
    - cosmosdb_mongo_database_name
    - cosmosdb_sql_database_name
EOT

  type = map(object({
    api_type                         = string
    cosmosdb_access_key              = string
    cosmosdb_account_id              = string
    name                             = string
    spring_cloud_app_id              = string
    cosmosdb_cassandra_keyspace_name = optional(string)
    cosmosdb_gremlin_database_name   = optional(string)
    cosmosdb_gremlin_graph_name      = optional(string)
    cosmosdb_mongo_database_name     = optional(string)
    cosmosdb_sql_database_name       = optional(string)
  }))
}
