resource "aws_rds_cluster_snapshot_copy" "rds_cluster_snapshot_copies" {
  for_each = var.rds_cluster_snapshot_copies

  source_db_cluster_snapshot_identifier = each.value.source_db_cluster_snapshot_identifier
  target_db_cluster_snapshot_identifier = each.value.target_db_cluster_snapshot_identifier
  copy_tags                             = each.value.copy_tags
  destination_region                    = each.value.destination_region
  kms_key_id                            = each.value.kms_key_id
  presigned_url                         = each.value.presigned_url
  region                                = each.value.region
  shared_accounts                       = each.value.shared_accounts
  tags                                  = each.value.tags
}
