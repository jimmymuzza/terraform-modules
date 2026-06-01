resource "azurerm_cosmosdb_postgresql_coordinator_configuration" "cosmosdb_postgresql_coordinator_configurations" {
  for_each = var.cosmosdb_postgresql_coordinator_configurations

  cluster_id = each.value.cluster_id
  name       = each.value.name
  value      = each.value.value
}
