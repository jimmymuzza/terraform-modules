resource "azurerm_cosmosdb_sql_role_definition" "cosmosdb_sql_role_definitions" {
  for_each = var.cosmosdb_sql_role_definitions

  account_name        = each.value.account_name
  assignable_scopes   = each.value.assignable_scopes
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  role_definition_id  = each.value.role_definition_id
  type                = each.value.type

  dynamic "permissions" {
    for_each = each.value.permissions != null ? each.value.permissions : []
    content {
      data_actions = permissions.value.data_actions
    }
  }
}
