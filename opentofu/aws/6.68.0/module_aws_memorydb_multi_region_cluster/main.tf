resource "aws_memorydb_multi_region_cluster" "memorydb_multi_region_clusters" {
  for_each = var.memorydb_multi_region_clusters

  multi_region_cluster_name_suffix  = each.value.multi_region_cluster_name_suffix
  node_type                         = each.value.node_type
  description                       = each.value.description
  engine                            = each.value.engine
  engine_version                    = each.value.engine_version
  multi_region_parameter_group_name = each.value.multi_region_parameter_group_name
  num_shards                        = each.value.num_shards
  region                            = each.value.region
  tags                              = each.value.tags
  tls_enabled                       = each.value.tls_enabled
  update_strategy                   = each.value.update_strategy
}
