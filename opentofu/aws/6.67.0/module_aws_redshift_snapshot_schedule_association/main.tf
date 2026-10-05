resource "aws_redshift_snapshot_schedule_association" "redshift_snapshot_schedule_associations" {
  for_each = var.redshift_snapshot_schedule_associations

  cluster_identifier  = each.value.cluster_identifier
  schedule_identifier = each.value.schedule_identifier
  region              = each.value.region
}
