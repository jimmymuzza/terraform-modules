resource "aws_lightsail_database" "lightsail_databases" {
  for_each = var.lightsail_databases

  blueprint_id                 = each.value.blueprint_id
  bundle_id                    = each.value.bundle_id
  master_database_name         = each.value.master_database_name
  master_password              = each.value.master_password
  master_username              = each.value.master_username
  relational_database_name     = each.value.relational_database_name
  apply_immediately            = each.value.apply_immediately
  availability_zone            = each.value.availability_zone
  backup_retention_enabled     = each.value.backup_retention_enabled
  final_snapshot_name          = each.value.final_snapshot_name
  preferred_backup_window      = each.value.preferred_backup_window
  preferred_maintenance_window = each.value.preferred_maintenance_window
  publicly_accessible          = each.value.publicly_accessible
  region                       = each.value.region
  skip_final_snapshot          = each.value.skip_final_snapshot
  tags                         = each.value.tags
  tags_all                     = each.value.tags_all
}
