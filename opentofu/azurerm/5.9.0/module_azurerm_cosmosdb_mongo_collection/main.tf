resource "azurerm_cosmosdb_mongo_collection" "cosmosdb_mongo_collections" {
  for_each = var.cosmosdb_mongo_collections

  account_name           = each.value.account_name
  database_name          = each.value.database_name
  name                   = each.value.name
  resource_group_name    = each.value.resource_group_name
  analytical_storage_ttl = each.value.analytical_storage_ttl
  default_ttl_seconds    = each.value.default_ttl_seconds
  shard_key              = each.value.shard_key
  throughput             = each.value.throughput

  dynamic "autoscale_settings" {
    for_each = each.value.autoscale_settings != null ? each.value.autoscale_settings : []
    content {
      max_throughput = autoscale_settings.value.max_throughput
    }
  }

  dynamic "index" {
    for_each = each.value.index != null ? each.value.index : []
    content {
      keys   = index.value.keys
      unique = index.value.unique
    }
  }
}
