resource "azurerm_cosmosdb_sql_role_assignment" "cosmosdb_sql_role_assignments" {
  for_each = var.cosmosdb_sql_role_assignments

  account_name        = each.value.account_name
  principal_id        = each.value.principal_id
  resource_group_name = each.value.resource_group_name
  role_definition_id  = each.value.role_definition_id
  scope               = each.value.scope
  name                = each.value.name
}
