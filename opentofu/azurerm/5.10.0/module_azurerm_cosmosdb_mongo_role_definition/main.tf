resource "azurerm_cosmosdb_mongo_role_definition" "cosmosdb_mongo_role_definitions" {
  for_each = var.cosmosdb_mongo_role_definitions

  cosmos_mongo_database_id = each.value.cosmos_mongo_database_id
  role_name                = each.value.role_name
  inherited_role_names     = each.value.inherited_role_names

  dynamic "privilege" {
    for_each = each.value.privilege != null ? each.value.privilege : []
    content {
      actions = privilege.value.actions

      dynamic "resource" {
        for_each = privilege.value.resource != null ? privilege.value.resource : []
        content {
          collection_name = resource.value.collection_name
          db_name         = resource.value.db_name
        }
      }
    }
  }
}
