resource "aws_memorydb_cluster" "memorydb_clusters" {
  for_each = var.memorydb_clusters

  acl_name                   = each.value.acl_name
  node_type                  = each.value.node_type
  auto_minor_version_upgrade = each.value.auto_minor_version_upgrade
  data_tiering               = each.value.data_tiering
  description                = each.value.description
  engine                     = each.value.engine
  engine_version             = each.value.engine_version
  final_snapshot_name        = each.value.final_snapshot_name
  kms_key_arn                = each.value.kms_key_arn
  maintenance_window         = each.value.maintenance_window
  multi_region_cluster_name  = each.value.multi_region_cluster_name
  name                       = each.value.name
  name_prefix                = each.value.name_prefix
  num_replicas_per_shard     = each.value.num_replicas_per_shard
  num_shards                 = each.value.num_shards
  parameter_group_name       = each.value.parameter_group_name
  port                       = each.value.port
  region                     = each.value.region
  security_group_ids         = each.value.security_group_ids
  snapshot_arns              = each.value.snapshot_arns
  snapshot_name              = each.value.snapshot_name
  snapshot_retention_limit   = each.value.snapshot_retention_limit
  snapshot_window            = each.value.snapshot_window
  sns_topic_arn              = each.value.sns_topic_arn
  subnet_group_name          = each.value.subnet_group_name
  tags                       = each.value.tags
  tags_all                   = each.value.tags_all
  tls_enabled                = each.value.tls_enabled
}
