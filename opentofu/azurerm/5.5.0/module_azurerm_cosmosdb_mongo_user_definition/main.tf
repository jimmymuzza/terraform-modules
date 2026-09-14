resource "azurerm_cosmosdb_mongo_user_definition" "cosmosdb_mongo_user_definitions" {
  for_each = var.cosmosdb_mongo_user_definitions

  cosmos_mongo_database_id = each.value.cosmos_mongo_database_id
  password                 = each.value.password
  username                 = each.value.username
  inherited_role_names     = each.value.inherited_role_names
}
