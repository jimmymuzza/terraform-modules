resource "azurerm_kusto_cosmosdb_data_connection" "kusto_cosmosdb_data_connections" {
  for_each = var.kusto_cosmosdb_data_connections

  cosmosdb_container_id = each.value.cosmosdb_container_id
  kusto_database_id     = each.value.kusto_database_id
  location              = each.value.location
  managed_identity_id   = each.value.managed_identity_id
  name                  = each.value.name
  table_name            = each.value.table_name
  mapping_rule_name     = each.value.mapping_rule_name
  retrieval_start_date  = each.value.retrieval_start_date
}
