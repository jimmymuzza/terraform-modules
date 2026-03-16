resource "aws_neptune_cluster_instance" "neptune_cluster_instances" {
  for_each = var.neptune_cluster_instances

  cluster_identifier           = each.value.cluster_identifier
  instance_class               = each.value.instance_class
  apply_immediately            = each.value.apply_immediately
  auto_minor_version_upgrade   = each.value.auto_minor_version_upgrade
  availability_zone            = each.value.availability_zone
  engine                       = each.value.engine
  engine_version               = each.value.engine_version
  identifier                   = each.value.identifier
  identifier_prefix            = each.value.identifier_prefix
  neptune_parameter_group_name = each.value.neptune_parameter_group_name
  neptune_subnet_group_name    = each.value.neptune_subnet_group_name
  port                         = each.value.port
  preferred_backup_window      = each.value.preferred_backup_window
  preferred_maintenance_window = each.value.preferred_maintenance_window
  promotion_tier               = each.value.promotion_tier
  publicly_accessible          = each.value.publicly_accessible
  region                       = each.value.region
  skip_final_snapshot          = each.value.skip_final_snapshot
  tags                         = each.value.tags
  tags_all                     = each.value.tags_all
}
