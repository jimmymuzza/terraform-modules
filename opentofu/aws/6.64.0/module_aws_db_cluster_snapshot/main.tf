resource "aws_db_cluster_snapshot" "db_cluster_snapshots" {
  for_each = var.db_cluster_snapshots

  db_cluster_identifier          = each.value.db_cluster_identifier
  db_cluster_snapshot_identifier = each.value.db_cluster_snapshot_identifier
  region                         = each.value.region
  shared_accounts                = each.value.shared_accounts
  tags                           = each.value.tags
  tags_all                       = each.value.tags_all
}
