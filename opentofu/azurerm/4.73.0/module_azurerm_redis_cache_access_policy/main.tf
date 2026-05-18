resource "azurerm_redis_cache_access_policy" "redis_cache_access_policies" {
  for_each = var.redis_cache_access_policies

  name           = each.value.name
  permissions    = each.value.permissions
  redis_cache_id = each.value.redis_cache_id
}
