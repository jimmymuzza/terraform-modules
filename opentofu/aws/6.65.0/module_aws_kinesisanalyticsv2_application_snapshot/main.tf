resource "aws_kinesisanalyticsv2_application_snapshot" "kinesisanalyticsv2_application_snapshots" {
  for_each = var.kinesisanalyticsv2_application_snapshots

  application_name = each.value.application_name
  snapshot_name    = each.value.snapshot_name
  region           = each.value.region
}
