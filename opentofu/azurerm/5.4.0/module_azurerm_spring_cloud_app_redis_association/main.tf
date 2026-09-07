resource "azurerm_spring_cloud_app_redis_association" "spring_cloud_app_redis_associations" {
  for_each = var.spring_cloud_app_redis_associations

  name                = each.value.name
  redis_access_key    = each.value.redis_access_key
  redis_cache_id      = each.value.redis_cache_id
  spring_cloud_app_id = each.value.spring_cloud_app_id
  ssl_enabled         = each.value.ssl_enabled
}
