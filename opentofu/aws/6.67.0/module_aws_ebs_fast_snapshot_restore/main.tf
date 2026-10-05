resource "aws_ebs_fast_snapshot_restore" "ebs_fast_snapshot_restores" {
  for_each = var.ebs_fast_snapshot_restores

  availability_zone = each.value.availability_zone
  snapshot_id       = each.value.snapshot_id
  region            = each.value.region
}
