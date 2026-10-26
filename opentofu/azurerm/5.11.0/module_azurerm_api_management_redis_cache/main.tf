resource "azurerm_api_management_redis_cache" "api_management_redis_caches" {
  for_each = var.api_management_redis_caches

  api_management_id = each.value.api_management_id
  connection_string = each.value.connection_string
  name              = each.value.name
  cache_location    = each.value.cache_location
  description       = each.value.description
  redis_cache_id    = each.value.redis_cache_id
}
