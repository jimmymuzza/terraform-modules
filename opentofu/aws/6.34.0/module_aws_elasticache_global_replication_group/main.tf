resource "aws_elasticache_global_replication_group" "elasticache_global_replication_groups" {
  for_each = var.elasticache_global_replication_groups

  global_replication_group_id_suffix   = each.value.global_replication_group_id_suffix
  primary_replication_group_id         = each.value.primary_replication_group_id
  automatic_failover_enabled           = each.value.automatic_failover_enabled
  cache_node_type                      = each.value.cache_node_type
  engine                               = each.value.engine
  engine_version                       = each.value.engine_version
  global_replication_group_description = each.value.global_replication_group_description
  num_node_groups                      = each.value.num_node_groups
  parameter_group_name                 = each.value.parameter_group_name
  region                               = each.value.region
}
