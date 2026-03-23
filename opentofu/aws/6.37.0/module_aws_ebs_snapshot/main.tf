resource "aws_ebs_snapshot" "ebs_snapshots" {
  for_each = var.ebs_snapshots

  volume_id              = each.value.volume_id
  description            = each.value.description
  outpost_arn            = each.value.outpost_arn
  permanent_restore      = each.value.permanent_restore
  region                 = each.value.region
  storage_tier           = each.value.storage_tier
  tags                   = each.value.tags
  tags_all               = each.value.tags_all
  temporary_restore_days = each.value.temporary_restore_days
}
