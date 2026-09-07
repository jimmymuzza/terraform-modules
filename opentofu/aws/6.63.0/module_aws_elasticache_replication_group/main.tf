resource "aws_elasticache_replication_group" "elasticache_replication_groups" {
  for_each = var.elasticache_replication_groups

  description                 = each.value.description
  replication_group_id        = each.value.replication_group_id
  apply_immediately           = each.value.apply_immediately
  at_rest_encryption_enabled  = each.value.at_rest_encryption_enabled
  auth_token                  = each.value.auth_token
  auth_token_update_strategy  = each.value.auth_token_update_strategy
  auth_token_wo               = each.value.auth_token_wo
  auth_token_wo_version       = each.value.auth_token_wo_version
  auto_minor_version_upgrade  = each.value.auto_minor_version_upgrade
  automatic_failover_enabled  = each.value.automatic_failover_enabled
  cluster_mode                = each.value.cluster_mode
  data_tiering_enabled        = each.value.data_tiering_enabled
  durability                  = each.value.durability
  engine                      = each.value.engine
  engine_version              = each.value.engine_version
  final_snapshot_identifier   = each.value.final_snapshot_identifier
  global_replication_group_id = each.value.global_replication_group_id
  ip_discovery                = each.value.ip_discovery
  kms_key_id                  = each.value.kms_key_id
  maintenance_window          = each.value.maintenance_window
  multi_az_enabled            = each.value.multi_az_enabled
  network_type                = each.value.network_type
  node_type                   = each.value.node_type
  notification_topic_arn      = each.value.notification_topic_arn
  num_cache_clusters          = each.value.num_cache_clusters
  num_node_groups             = each.value.num_node_groups
  parameter_group_name        = each.value.parameter_group_name
  port                        = each.value.port
  preferred_cache_cluster_azs = each.value.preferred_cache_cluster_azs
  region                      = each.value.region
  replicas_per_node_group     = each.value.replicas_per_node_group
  security_group_ids          = each.value.security_group_ids
  security_group_names        = each.value.security_group_names
  snapshot_arns               = each.value.snapshot_arns
  snapshot_name               = each.value.snapshot_name
  snapshot_retention_limit    = each.value.snapshot_retention_limit
  snapshot_window             = each.value.snapshot_window
  subnet_group_name           = each.value.subnet_group_name
  tags                        = each.value.tags
  tags_all                    = each.value.tags_all
  transit_encryption_enabled  = each.value.transit_encryption_enabled
  transit_encryption_mode     = each.value.transit_encryption_mode
  user_group_ids              = each.value.user_group_ids

  dynamic "log_delivery_configuration" {
    for_each = each.value.log_delivery_configuration != null ? each.value.log_delivery_configuration : []
    content {
      destination      = log_delivery_configuration.value.destination
      destination_type = log_delivery_configuration.value.destination_type
      log_format       = log_delivery_configuration.value.log_format
      log_type         = log_delivery_configuration.value.log_type
    }
  }

  dynamic "node_group_configuration" {
    for_each = each.value.node_group_configuration != null ? each.value.node_group_configuration : []
    content {
      node_group_id              = node_group_configuration.value.node_group_id
      primary_availability_zone  = node_group_configuration.value.primary_availability_zone
      primary_outpost_arn        = node_group_configuration.value.primary_outpost_arn
      replica_availability_zones = node_group_configuration.value.replica_availability_zones
      replica_count              = node_group_configuration.value.replica_count
      replica_outpost_arns       = node_group_configuration.value.replica_outpost_arns
      slots                      = node_group_configuration.value.slots
    }
  }
}
