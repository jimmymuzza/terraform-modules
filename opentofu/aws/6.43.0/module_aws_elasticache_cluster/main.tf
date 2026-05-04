resource "aws_elasticache_cluster" "elasticache_clusters" {
  for_each = var.elasticache_clusters

  cluster_id                   = each.value.cluster_id
  apply_immediately            = each.value.apply_immediately
  auto_minor_version_upgrade   = each.value.auto_minor_version_upgrade
  availability_zone            = each.value.availability_zone
  az_mode                      = each.value.az_mode
  engine                       = each.value.engine
  engine_version               = each.value.engine_version
  final_snapshot_identifier    = each.value.final_snapshot_identifier
  ip_discovery                 = each.value.ip_discovery
  maintenance_window           = each.value.maintenance_window
  network_type                 = each.value.network_type
  node_type                    = each.value.node_type
  notification_topic_arn       = each.value.notification_topic_arn
  num_cache_nodes              = each.value.num_cache_nodes
  outpost_mode                 = each.value.outpost_mode
  parameter_group_name         = each.value.parameter_group_name
  port                         = each.value.port
  preferred_availability_zones = each.value.preferred_availability_zones
  preferred_outpost_arn        = each.value.preferred_outpost_arn
  region                       = each.value.region
  replication_group_id         = each.value.replication_group_id
  security_group_ids           = each.value.security_group_ids
  snapshot_arns                = each.value.snapshot_arns
  snapshot_name                = each.value.snapshot_name
  snapshot_retention_limit     = each.value.snapshot_retention_limit
  snapshot_window              = each.value.snapshot_window
  subnet_group_name            = each.value.subnet_group_name
  tags                         = each.value.tags
  tags_all                     = each.value.tags_all
  transit_encryption_enabled   = each.value.transit_encryption_enabled

  dynamic "log_delivery_configuration" {
    for_each = each.value.log_delivery_configuration != null ? each.value.log_delivery_configuration : []
    content {
      destination      = log_delivery_configuration.value.destination
      destination_type = log_delivery_configuration.value.destination_type
      log_format       = log_delivery_configuration.value.log_format
      log_type         = log_delivery_configuration.value.log_type
    }
  }
}
