resource "azurerm_kusto_database" "kusto_databases" {
  for_each = var.kusto_databases

  cluster_name        = each.value.cluster_name
  location            = each.value.location
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  hot_cache_period    = each.value.hot_cache_period
  soft_delete_period  = each.value.soft_delete_period
}
