resource "aws_rds_global_cluster" "rds_global_clusters" {
  for_each = var.rds_global_clusters

  global_cluster_identifier    = each.value.global_cluster_identifier
  database_name                = each.value.database_name
  deletion_protection          = each.value.deletion_protection
  engine                       = each.value.engine
  engine_lifecycle_support     = each.value.engine_lifecycle_support
  engine_version               = each.value.engine_version
  force_destroy                = each.value.force_destroy
  region                       = each.value.region
  source_db_cluster_identifier = each.value.source_db_cluster_identifier
  storage_encrypted            = each.value.storage_encrypted
  tags                         = each.value.tags
  tags_all                     = each.value.tags_all
}
