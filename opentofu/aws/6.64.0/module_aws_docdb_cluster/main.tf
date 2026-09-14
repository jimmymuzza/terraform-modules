resource "aws_docdb_cluster" "docdb_clusters" {
  for_each = var.docdb_clusters

  allow_major_version_upgrade     = each.value.allow_major_version_upgrade
  apply_immediately               = each.value.apply_immediately
  availability_zones              = each.value.availability_zones
  backup_retention_period         = each.value.backup_retention_period
  cluster_identifier              = each.value.cluster_identifier
  cluster_identifier_prefix       = each.value.cluster_identifier_prefix
  cluster_members                 = each.value.cluster_members
  db_cluster_parameter_group_name = each.value.db_cluster_parameter_group_name
  db_subnet_group_name            = each.value.db_subnet_group_name
  deletion_protection             = each.value.deletion_protection
  enabled_cloudwatch_logs_exports = each.value.enabled_cloudwatch_logs_exports
  engine                          = each.value.engine
  engine_version                  = each.value.engine_version
  final_snapshot_identifier       = each.value.final_snapshot_identifier
  global_cluster_identifier       = each.value.global_cluster_identifier
  kms_key_id                      = each.value.kms_key_id
  manage_master_user_password     = each.value.manage_master_user_password
  master_password                 = each.value.master_password
  master_password_wo              = each.value.master_password_wo
  master_password_wo_version      = each.value.master_password_wo_version
  master_username                 = each.value.master_username
  network_type                    = each.value.network_type
  port                            = each.value.port
  preferred_backup_window         = each.value.preferred_backup_window
  preferred_maintenance_window    = each.value.preferred_maintenance_window
  region                          = each.value.region
  skip_final_snapshot             = each.value.skip_final_snapshot
  snapshot_identifier             = each.value.snapshot_identifier
  storage_encrypted               = each.value.storage_encrypted
  storage_type                    = each.value.storage_type
  tags                            = each.value.tags
  tags_all                        = each.value.tags_all
  vpc_security_group_ids          = each.value.vpc_security_group_ids

  dynamic "restore_to_point_in_time" {
    for_each = each.value.restore_to_point_in_time != null ? each.value.restore_to_point_in_time : []
    content {
      source_cluster_identifier  = restore_to_point_in_time.value.source_cluster_identifier
      restore_to_time            = restore_to_point_in_time.value.restore_to_time
      restore_type               = restore_to_point_in_time.value.restore_type
      use_latest_restorable_time = restore_to_point_in_time.value.use_latest_restorable_time
    }
  }

  dynamic "serverless_v2_scaling_configuration" {
    for_each = each.value.serverless_v2_scaling_configuration != null ? each.value.serverless_v2_scaling_configuration : []
    content {
      max_capacity = serverless_v2_scaling_configuration.value.max_capacity
      min_capacity = serverless_v2_scaling_configuration.value.min_capacity
    }
  }
}
