resource "azurerm_cosmosdb_postgresql_role" "cosmosdb_postgresql_roles" {
  for_each = var.cosmosdb_postgresql_roles

  cluster_id = each.value.cluster_id
  name       = each.value.name
  password   = each.value.password
}
