resource "aws_snapshot_create_volume_permission" "snapshot_create_volume_permissions" {
  for_each = var.snapshot_create_volume_permissions

  account_id  = each.value.account_id
  snapshot_id = each.value.snapshot_id
  region      = each.value.region
}
