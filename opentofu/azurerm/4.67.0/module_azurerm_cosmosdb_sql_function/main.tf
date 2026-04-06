resource "azurerm_cosmosdb_sql_function" "cosmosdb_sql_functions" {
  for_each = var.cosmosdb_sql_functions

  body         = each.value.body
  container_id = each.value.container_id
  name         = each.value.name
}
