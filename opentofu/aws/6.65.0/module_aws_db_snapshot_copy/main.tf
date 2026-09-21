resource "aws_db_snapshot_copy" "db_snapshot_copies" {
  for_each = var.db_snapshot_copies

  source_db_snapshot_identifier   = each.value.source_db_snapshot_identifier
  target_db_snapshot_identifier   = each.value.target_db_snapshot_identifier
  copy_tags                       = each.value.copy_tags
  destination_region              = each.value.destination_region
  kms_key_id                      = each.value.kms_key_id
  option_group_name               = each.value.option_group_name
  presigned_url                   = each.value.presigned_url
  region                          = each.value.region
  shared_accounts                 = each.value.shared_accounts
  tags                            = each.value.tags
  tags_all                        = each.value.tags_all
  target_custom_availability_zone = each.value.target_custom_availability_zone
}
