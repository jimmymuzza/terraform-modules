resource "aws_docdb_cluster_snapshot" "docdb_cluster_snapshots" {
  for_each = var.docdb_cluster_snapshots

  db_cluster_identifier          = each.value.db_cluster_identifier
  db_cluster_snapshot_identifier = each.value.db_cluster_snapshot_identifier
  region                         = each.value.region
}
