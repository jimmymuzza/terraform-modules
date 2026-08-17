resource "aws_rds_cluster_instance" "rds_cluster_instances" {
  for_each = var.rds_cluster_instances

  cluster_identifier                    = each.value.cluster_identifier
  engine                                = each.value.engine
  instance_class                        = each.value.instance_class
  apply_immediately                     = each.value.apply_immediately
  auto_minor_version_upgrade            = each.value.auto_minor_version_upgrade
  availability_zone                     = each.value.availability_zone
  ca_cert_identifier                    = each.value.ca_cert_identifier
  copy_tags_to_snapshot                 = each.value.copy_tags_to_snapshot
  custom_iam_instance_profile           = each.value.custom_iam_instance_profile
  db_parameter_group_name               = each.value.db_parameter_group_name
  db_subnet_group_name                  = each.value.db_subnet_group_name
  engine_version                        = each.value.engine_version
  force_destroy                         = each.value.force_destroy
  identifier                            = each.value.identifier
  identifier_prefix                     = each.value.identifier_prefix
  monitoring_interval                   = each.value.monitoring_interval
  monitoring_role_arn                   = each.value.monitoring_role_arn
  performance_insights_enabled          = each.value.performance_insights_enabled
  performance_insights_kms_key_id       = each.value.performance_insights_kms_key_id
  performance_insights_retention_period = each.value.performance_insights_retention_period
  preferred_backup_window               = each.value.preferred_backup_window
  preferred_maintenance_window          = each.value.preferred_maintenance_window
  promotion_tier                        = each.value.promotion_tier
  publicly_accessible                   = each.value.publicly_accessible
  region                                = each.value.region
  tags                                  = each.value.tags
  tags_all                              = each.value.tags_all
}
