resource "aws_docdb_global_cluster" "docdb_global_clusters" {
  for_each = var.docdb_global_clusters

  global_cluster_identifier    = each.value.global_cluster_identifier
  database_name                = each.value.database_name
  deletion_protection          = each.value.deletion_protection
  engine                       = each.value.engine
  engine_version               = each.value.engine_version
  region                       = each.value.region
  source_db_cluster_identifier = each.value.source_db_cluster_identifier
  storage_encrypted            = each.value.storage_encrypted
}
