resource "aws_db_snapshot" "db_snapshots" {
  for_each = var.db_snapshots

  db_instance_identifier = each.value.db_instance_identifier
  db_snapshot_identifier = each.value.db_snapshot_identifier
  region                 = each.value.region
  shared_accounts        = each.value.shared_accounts
  tags                   = each.value.tags
  tags_all               = each.value.tags_all
}
