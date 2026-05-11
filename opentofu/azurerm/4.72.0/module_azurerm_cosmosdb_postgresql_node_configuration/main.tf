resource "azurerm_cosmosdb_postgresql_node_configuration" "cosmosdb_postgresql_node_configurations" {
  for_each = var.cosmosdb_postgresql_node_configurations

  cluster_id = each.value.cluster_id
  name       = each.value.name
  value      = each.value.value
}
