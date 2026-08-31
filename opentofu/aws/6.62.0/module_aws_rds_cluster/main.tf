resource "aws_rds_cluster" "rds_clusters" {
  for_each = var.rds_clusters

  engine                                = each.value.engine
  allocated_storage                     = each.value.allocated_storage
  allow_major_version_upgrade           = each.value.allow_major_version_upgrade
  apply_immediately                     = each.value.apply_immediately
  auto_minor_version_upgrade            = each.value.auto_minor_version_upgrade
  availability_zones                    = each.value.availability_zones
  backtrack_window                      = each.value.backtrack_window
  backup_retention_period               = each.value.backup_retention_period
  ca_certificate_identifier             = each.value.ca_certificate_identifier
  cluster_identifier                    = each.value.cluster_identifier
  cluster_identifier_prefix             = each.value.cluster_identifier_prefix
  cluster_members                       = each.value.cluster_members
  cluster_scalability_type              = each.value.cluster_scalability_type
  copy_tags_to_snapshot                 = each.value.copy_tags_to_snapshot
  database_insights_mode                = each.value.database_insights_mode
  database_name                         = each.value.database_name
  db_cluster_instance_class             = each.value.db_cluster_instance_class
  db_cluster_parameter_group_name       = each.value.db_cluster_parameter_group_name
  db_instance_parameter_group_name      = each.value.db_instance_parameter_group_name
  db_subnet_group_name                  = each.value.db_subnet_group_name
  db_system_id                          = each.value.db_system_id
  delete_automated_backups              = each.value.delete_automated_backups
  deletion_protection                   = each.value.deletion_protection
  domain                                = each.value.domain
  domain_iam_role_name                  = each.value.domain_iam_role_name
  enable_global_write_forwarding        = each.value.enable_global_write_forwarding
  enable_http_endpoint                  = each.value.enable_http_endpoint
  enable_local_write_forwarding         = each.value.enable_local_write_forwarding
  enabled_cloudwatch_logs_exports       = each.value.enabled_cloudwatch_logs_exports
  engine_lifecycle_support              = each.value.engine_lifecycle_support
  engine_mode                           = each.value.engine_mode
  engine_version                        = each.value.engine_version
  final_snapshot_identifier             = each.value.final_snapshot_identifier
  global_cluster_identifier             = each.value.global_cluster_identifier
  iam_database_authentication_enabled   = each.value.iam_database_authentication_enabled
  iam_roles                             = each.value.iam_roles
  iops                                  = each.value.iops
  kms_key_id                            = each.value.kms_key_id
  manage_master_user_password           = each.value.manage_master_user_password
  master_password                       = each.value.master_password
  master_password_wo                    = each.value.master_password_wo
  master_password_wo_version            = each.value.master_password_wo_version
  master_user_secret_kms_key_id         = each.value.master_user_secret_kms_key_id
  master_username                       = each.value.master_username
  monitoring_interval                   = each.value.monitoring_interval
  monitoring_role_arn                   = each.value.monitoring_role_arn
  network_type                          = each.value.network_type
  performance_insights_enabled          = each.value.performance_insights_enabled
  performance_insights_kms_key_id       = each.value.performance_insights_kms_key_id
  performance_insights_retention_period = each.value.performance_insights_retention_period
  port                                  = each.value.port
  preferred_backup_window               = each.value.preferred_backup_window
  preferred_maintenance_window          = each.value.preferred_maintenance_window
  region                                = each.value.region
  replication_source_identifier         = each.value.replication_source_identifier
  skip_final_snapshot                   = each.value.skip_final_snapshot
  snapshot_identifier                   = each.value.snapshot_identifier
  source_region                         = each.value.source_region
  storage_encrypted                     = each.value.storage_encrypted
  storage_type                          = each.value.storage_type
  tags                                  = each.value.tags
  tags_all                              = each.value.tags_all
  vpc_security_group_ids                = each.value.vpc_security_group_ids

  dynamic "restore_to_point_in_time" {
    for_each = each.value.restore_to_point_in_time != null ? each.value.restore_to_point_in_time : []
    content {
      restore_to_time            = restore_to_point_in_time.value.restore_to_time
      restore_type               = restore_to_point_in_time.value.restore_type
      source_cluster_identifier  = restore_to_point_in_time.value.source_cluster_identifier
      source_cluster_resource_id = restore_to_point_in_time.value.source_cluster_resource_id
      use_latest_restorable_time = restore_to_point_in_time.value.use_latest_restorable_time
    }
  }

  dynamic "s3_import" {
    for_each = each.value.s3_import != null ? each.value.s3_import : []
    content {
      bucket_name           = s3_import.value.bucket_name
      ingestion_role        = s3_import.value.ingestion_role
      source_engine         = s3_import.value.source_engine
      source_engine_version = s3_import.value.source_engine_version
      bucket_prefix         = s3_import.value.bucket_prefix
    }
  }

  dynamic "scaling_configuration" {
    for_each = each.value.scaling_configuration != null ? each.value.scaling_configuration : []
    content {
      auto_pause               = scaling_configuration.value.auto_pause
      max_capacity             = scaling_configuration.value.max_capacity
      min_capacity             = scaling_configuration.value.min_capacity
      seconds_before_timeout   = scaling_configuration.value.seconds_before_timeout
      seconds_until_auto_pause = scaling_configuration.value.seconds_until_auto_pause
      timeout_action           = scaling_configuration.value.timeout_action
    }
  }

  dynamic "serverlessv2_scaling_configuration" {
    for_each = each.value.serverlessv2_scaling_configuration != null ? each.value.serverlessv2_scaling_configuration : []
    content {
      max_capacity             = serverlessv2_scaling_configuration.value.max_capacity
      min_capacity             = serverlessv2_scaling_configuration.value.min_capacity
      seconds_until_auto_pause = serverlessv2_scaling_configuration.value.seconds_until_auto_pause
    }
  }
}
