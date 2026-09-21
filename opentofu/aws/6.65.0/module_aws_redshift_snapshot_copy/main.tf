resource "aws_redshift_snapshot_copy" "redshift_snapshot_copies" {
  for_each = var.redshift_snapshot_copies

  cluster_identifier               = each.value.cluster_identifier
  destination_region               = each.value.destination_region
  manual_snapshot_retention_period = each.value.manual_snapshot_retention_period
  region                           = each.value.region
  retention_period                 = each.value.retention_period
  snapshot_copy_grant_name         = each.value.snapshot_copy_grant_name
}
