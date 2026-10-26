resource "aws_elasticache_reserved_cache_node" "elasticache_reserved_cache_nodes" {
  for_each = var.elasticache_reserved_cache_nodes

  reserved_cache_nodes_offering_id = each.value.reserved_cache_nodes_offering_id
  cache_node_count                 = each.value.cache_node_count
  region                           = each.value.region
  tags                             = each.value.tags
}
