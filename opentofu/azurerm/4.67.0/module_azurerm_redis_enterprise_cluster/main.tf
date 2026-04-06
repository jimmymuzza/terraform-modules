resource "azurerm_redis_enterprise_cluster" "redis_enterprise_clusters" {
  for_each = var.redis_enterprise_clusters

  location            = each.value.location
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  sku_name            = each.value.sku_name
  minimum_tls_version = each.value.minimum_tls_version
  tags                = each.value.tags
  zones               = each.value.zones
}
