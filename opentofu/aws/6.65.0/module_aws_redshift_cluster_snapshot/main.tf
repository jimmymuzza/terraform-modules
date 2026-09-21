resource "aws_redshift_cluster_snapshot" "redshift_cluster_snapshots" {
  for_each = var.redshift_cluster_snapshots

  cluster_identifier               = each.value.cluster_identifier
  snapshot_identifier              = each.value.snapshot_identifier
  manual_snapshot_retention_period = each.value.manual_snapshot_retention_period
  region                           = each.value.region
  tags                             = each.value.tags
  tags_all                         = each.value.tags_all
}
