resource "azurerm_managed_redis_geo_replication" "managed_redis_geo_replications" {
  for_each = var.managed_redis_geo_replications

  linked_managed_redis_ids = each.value.linked_managed_redis_ids
  managed_redis_id         = each.value.managed_redis_id
}
