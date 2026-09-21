resource "aws_neptune_cluster_snapshot" "neptune_cluster_snapshots" {
  for_each = var.neptune_cluster_snapshots

  db_cluster_identifier          = each.value.db_cluster_identifier
  db_cluster_snapshot_identifier = each.value.db_cluster_snapshot_identifier
  region                         = each.value.region
}
