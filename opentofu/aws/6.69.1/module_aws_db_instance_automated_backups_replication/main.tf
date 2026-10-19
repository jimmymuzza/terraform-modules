resource "aws_db_instance_automated_backups_replication" "db_instance_automated_backups_replications" {
  for_each = var.db_instance_automated_backups_replications

  source_db_instance_arn = each.value.source_db_instance_arn
  kms_key_id             = each.value.kms_key_id
  pre_signed_url         = each.value.pre_signed_url
  region                 = each.value.region
  retention_period       = each.value.retention_period
}
