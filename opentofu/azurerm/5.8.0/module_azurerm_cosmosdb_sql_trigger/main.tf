resource "azurerm_cosmosdb_sql_trigger" "cosmosdb_sql_triggers" {
  for_each = var.cosmosdb_sql_triggers

  body         = each.value.body
  container_id = each.value.container_id
  name         = each.value.name
  operation    = each.value.operation
  type         = each.value.type
}
