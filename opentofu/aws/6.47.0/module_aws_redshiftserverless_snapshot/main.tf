resource "aws_redshiftserverless_snapshot" "redshiftserverless_snapshots" {
  for_each = var.redshiftserverless_snapshots

  namespace_name   = each.value.namespace_name
  snapshot_name    = each.value.snapshot_name
  region           = each.value.region
  retention_period = each.value.retention_period
}
