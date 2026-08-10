resource "azurerm_redis_linked_server" "redis_linked_servers" {
  for_each = var.redis_linked_servers

  linked_redis_cache_id       = each.value.linked_redis_cache_id
  linked_redis_cache_location = each.value.linked_redis_cache_location
  resource_group_name         = each.value.resource_group_name
  server_role                 = each.value.server_role
  target_redis_cache_name     = each.value.target_redis_cache_name
}
