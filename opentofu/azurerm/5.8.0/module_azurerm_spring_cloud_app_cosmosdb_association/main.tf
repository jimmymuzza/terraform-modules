resource "azurerm_spring_cloud_app_cosmosdb_association" "spring_cloud_app_cosmosdb_associations" {
  for_each = var.spring_cloud_app_cosmosdb_associations

  api_type                         = each.value.api_type
  cosmosdb_access_key              = each.value.cosmosdb_access_key
  cosmosdb_account_id              = each.value.cosmosdb_account_id
  name                             = each.value.name
  spring_cloud_app_id              = each.value.spring_cloud_app_id
  cosmosdb_cassandra_keyspace_name = each.value.cosmosdb_cassandra_keyspace_name
  cosmosdb_gremlin_database_name   = each.value.cosmosdb_gremlin_database_name
  cosmosdb_gremlin_graph_name      = each.value.cosmosdb_gremlin_graph_name
  cosmosdb_mongo_database_name     = each.value.cosmosdb_mongo_database_name
  cosmosdb_sql_database_name       = each.value.cosmosdb_sql_database_name
}
