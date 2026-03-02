resource "azurerm_cosmosdb_sql_dedicated_gateway" "cosmosdb_sql_dedicated_gateways" {
  for_each = var.cosmosdb_sql_dedicated_gateways

  cosmosdb_account_id = each.value.cosmosdb_account_id
  instance_count      = each.value.instance_count
  instance_size       = each.value.instance_size
}
