resource "aws_neptune_cluster" "neptune_clusters" {
  for_each = var.neptune_clusters

  allow_major_version_upgrade           = each.value.allow_major_version_upgrade
  apply_immediately                     = each.value.apply_immediately
  availability_zones                    = each.value.availability_zones
  backup_retention_period               = each.value.backup_retention_period
  cluster_identifier                    = each.value.cluster_identifier
  cluster_identifier_prefix             = each.value.cluster_identifier_prefix
  copy_tags_to_snapshot                 = each.value.copy_tags_to_snapshot
  deletion_protection                   = each.value.deletion_protection
  enable_cloudwatch_logs_exports        = each.value.enable_cloudwatch_logs_exports
  engine                                = each.value.engine
  engine_version                        = each.value.engine_version
  final_snapshot_identifier             = each.value.final_snapshot_identifier
  global_cluster_identifier             = each.value.global_cluster_identifier
  iam_database_authentication_enabled   = each.value.iam_database_authentication_enabled
  iam_roles                             = each.value.iam_roles
  kms_key_arn                           = each.value.kms_key_arn
  neptune_cluster_parameter_group_name  = each.value.neptune_cluster_parameter_group_name
  neptune_instance_parameter_group_name = each.value.neptune_instance_parameter_group_name
  neptune_subnet_group_name             = each.value.neptune_subnet_group_name
  port                                  = each.value.port
  preferred_backup_window               = each.value.preferred_backup_window
  preferred_maintenance_window          = each.value.preferred_maintenance_window
  region                                = each.value.region
  replication_source_identifier         = each.value.replication_source_identifier
  skip_final_snapshot                   = each.value.skip_final_snapshot
  snapshot_identifier                   = each.value.snapshot_identifier
  storage_encrypted                     = each.value.storage_encrypted
  storage_type                          = each.value.storage_type
  tags                                  = each.value.tags
  tags_all                              = each.value.tags_all
  vpc_security_group_ids                = each.value.vpc_security_group_ids

  dynamic "serverless_v2_scaling_configuration" {
    for_each = each.value.serverless_v2_scaling_configuration != null ? each.value.serverless_v2_scaling_configuration : []
    content {
      max_capacity = serverless_v2_scaling_configuration.value.max_capacity
      min_capacity = serverless_v2_scaling_configuration.value.min_capacity
    }
  }
}
