resource "azurerm_redis_enterprise_database" "redis_enterprise_databases" {
  for_each = var.redis_enterprise_databases

  cluster_id                     = each.value.cluster_id
  client_protocol                = each.value.client_protocol
  clustering_policy              = each.value.clustering_policy
  eviction_policy                = each.value.eviction_policy
  linked_database_group_nickname = each.value.linked_database_group_nickname
  linked_database_id             = each.value.linked_database_id
  name                           = each.value.name
  port                           = each.value.port

  dynamic "module" {
    for_each = each.value.module != null ? each.value.module : []
    content {
      name = module.value.name
      args = module.value.args
    }
  }
}
