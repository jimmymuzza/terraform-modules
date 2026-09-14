resource "azurerm_redis_cache_access_policy_assignment" "redis_cache_access_policy_assignments" {
  for_each = var.redis_cache_access_policy_assignments

  access_policy_name = each.value.access_policy_name
  name               = each.value.name
  object_id          = each.value.object_id
  object_id_alias    = each.value.object_id_alias
  redis_cache_id     = each.value.redis_cache_id
}
