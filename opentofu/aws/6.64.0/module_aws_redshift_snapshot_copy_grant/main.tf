resource "aws_redshift_snapshot_copy_grant" "redshift_snapshot_copy_grants" {
  for_each = var.redshift_snapshot_copy_grants

  snapshot_copy_grant_name = each.value.snapshot_copy_grant_name
  kms_key_id               = each.value.kms_key_id
  region                   = each.value.region
  tags                     = each.value.tags
  tags_all                 = each.value.tags_all
}
