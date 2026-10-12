resource "azurerm_cosmosdb_cassandra_keyspace" "cosmosdb_cassandra_keyspaces" {
  for_each = var.cosmosdb_cassandra_keyspaces

  account_name        = each.value.account_name
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  throughput          = each.value.throughput

  dynamic "autoscale_settings" {
    for_each = each.value.autoscale_settings != null ? each.value.autoscale_settings : []
    content {
      max_throughput = autoscale_settings.value.max_throughput
    }
  }
}
