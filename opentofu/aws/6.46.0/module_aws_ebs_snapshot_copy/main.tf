resource "aws_ebs_snapshot_copy" "ebs_snapshot_copies" {
  for_each = var.ebs_snapshot_copies

  source_region               = each.value.source_region
  source_snapshot_id          = each.value.source_snapshot_id
  completion_duration_minutes = each.value.completion_duration_minutes
  description                 = each.value.description
  encrypted                   = each.value.encrypted
  kms_key_id                  = each.value.kms_key_id
  permanent_restore           = each.value.permanent_restore
  region                      = each.value.region
  storage_tier                = each.value.storage_tier
  tags                        = each.value.tags
  tags_all                    = each.value.tags_all
  temporary_restore_days      = each.value.temporary_restore_days
}
