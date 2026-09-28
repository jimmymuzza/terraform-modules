resource "aws_rds_shard_group" "rds_shard_groups" {
  for_each = var.rds_shard_groups

  db_cluster_identifier     = each.value.db_cluster_identifier
  db_shard_group_identifier = each.value.db_shard_group_identifier
  max_acu                   = each.value.max_acu
  compute_redundancy        = each.value.compute_redundancy
  min_acu                   = each.value.min_acu
  publicly_accessible       = each.value.publicly_accessible
  region                    = each.value.region
  tags                      = each.value.tags
}
