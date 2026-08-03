resource "azurerm_cosmosdb_sql_stored_procedure" "cosmosdb_sql_stored_procedures" {
  for_each = var.cosmosdb_sql_stored_procedures

  account_name        = each.value.account_name
  body                = each.value.body
  container_name      = each.value.container_name
  database_name       = each.value.database_name
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
}
