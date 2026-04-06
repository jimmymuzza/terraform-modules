resource "aws_db_instance" "db_instances" {
  for_each = var.db_instances

  instance_class                        = each.value.instance_class
  allocated_storage                     = each.value.allocated_storage
  allow_major_version_upgrade           = each.value.allow_major_version_upgrade
  apply_immediately                     = each.value.apply_immediately
  auto_minor_version_upgrade            = each.value.auto_minor_version_upgrade
  availability_zone                     = each.value.availability_zone
  backup_retention_period               = each.value.backup_retention_period
  backup_target                         = each.value.backup_target
  backup_window                         = each.value.backup_window
  ca_cert_identifier                    = each.value.ca_cert_identifier
  character_set_name                    = each.value.character_set_name
  copy_tags_to_snapshot                 = each.value.copy_tags_to_snapshot
  custom_iam_instance_profile           = each.value.custom_iam_instance_profile
  customer_owned_ip_enabled             = each.value.customer_owned_ip_enabled
  database_insights_mode                = each.value.database_insights_mode
  db_name                               = each.value.db_name
  db_subnet_group_name                  = each.value.db_subnet_group_name
  dedicated_log_volume                  = each.value.dedicated_log_volume
  delete_automated_backups              = each.value.delete_automated_backups
  deletion_protection                   = each.value.deletion_protection
  domain                                = each.value.domain
  domain_auth_secret_arn                = each.value.domain_auth_secret_arn
  domain_dns_ips                        = each.value.domain_dns_ips
  domain_fqdn                           = each.value.domain_fqdn
  domain_iam_role_name                  = each.value.domain_iam_role_name
  domain_ou                             = each.value.domain_ou
  enabled_cloudwatch_logs_exports       = each.value.enabled_cloudwatch_logs_exports
  engine                                = each.value.engine
  engine_lifecycle_support              = each.value.engine_lifecycle_support
  engine_version                        = each.value.engine_version
  final_snapshot_identifier             = each.value.final_snapshot_identifier
  iam_database_authentication_enabled   = each.value.iam_database_authentication_enabled
  identifier                            = each.value.identifier
  identifier_prefix                     = each.value.identifier_prefix
  iops                                  = each.value.iops
  kms_key_id                            = each.value.kms_key_id
  license_model                         = each.value.license_model
  maintenance_window                    = each.value.maintenance_window
  manage_master_user_password           = each.value.manage_master_user_password
  master_user_secret_kms_key_id         = each.value.master_user_secret_kms_key_id
  max_allocated_storage                 = each.value.max_allocated_storage
  monitoring_interval                   = each.value.monitoring_interval
  monitoring_role_arn                   = each.value.monitoring_role_arn
  multi_az                              = each.value.multi_az
  nchar_character_set_name              = each.value.nchar_character_set_name
  network_type                          = each.value.network_type
  option_group_name                     = each.value.option_group_name
  parameter_group_name                  = each.value.parameter_group_name
  password                              = each.value.password
  password_wo                           = each.value.password_wo
  password_wo_version                   = each.value.password_wo_version
  performance_insights_enabled          = each.value.performance_insights_enabled
  performance_insights_kms_key_id       = each.value.performance_insights_kms_key_id
  performance_insights_retention_period = each.value.performance_insights_retention_period
  port                                  = each.value.port
  publicly_accessible                   = each.value.publicly_accessible
  region                                = each.value.region
  replica_mode                          = each.value.replica_mode
  replicate_source_db                   = each.value.replicate_source_db
  skip_final_snapshot                   = each.value.skip_final_snapshot
  snapshot_identifier                   = each.value.snapshot_identifier
  storage_encrypted                     = each.value.storage_encrypted
  storage_throughput                    = each.value.storage_throughput
  storage_type                          = each.value.storage_type
  tags                                  = each.value.tags
  tags_all                              = each.value.tags_all
  timezone                              = each.value.timezone
  upgrade_storage_config                = each.value.upgrade_storage_config
  username                              = each.value.username
  vpc_security_group_ids                = each.value.vpc_security_group_ids

  dynamic "blue_green_update" {
    for_each = each.value.blue_green_update != null ? each.value.blue_green_update : []
    content {
      enabled = blue_green_update.value.enabled
    }
  }

  dynamic "restore_to_point_in_time" {
    for_each = each.value.restore_to_point_in_time != null ? each.value.restore_to_point_in_time : []
    content {
      restore_time                             = restore_to_point_in_time.value.restore_time
      source_db_instance_automated_backups_arn = restore_to_point_in_time.value.source_db_instance_automated_backups_arn
      source_db_instance_identifier            = restore_to_point_in_time.value.source_db_instance_identifier
      source_dbi_resource_id                   = restore_to_point_in_time.value.source_dbi_resource_id
      use_latest_restorable_time               = restore_to_point_in_time.value.use_latest_restorable_time
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
}
