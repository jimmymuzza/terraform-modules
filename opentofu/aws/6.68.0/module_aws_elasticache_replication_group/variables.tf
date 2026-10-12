variable "elasticache_replication_groups" {
  description = <<EOT
Map of elasticache_replication_groups, attributes below
Required:
    - description
    - replication_group_id
Optional:
    - apply_immediately
    - at_rest_encryption_enabled
    - auth_token
    - auth_token_update_strategy
    - auth_token_wo
    - auth_token_wo_version
    - auto_minor_version_upgrade
    - automatic_failover_enabled
    - cluster_mode
    - data_tiering_enabled
    - durability
    - engine
    - engine_version
    - final_snapshot_identifier
    - global_replication_group_id
    - ip_discovery
    - kms_key_id
    - maintenance_window
    - multi_az_enabled
    - network_type
    - node_type
    - notification_topic_arn
    - num_cache_clusters
    - num_node_groups
    - parameter_group_name
    - port
    - preferred_cache_cluster_azs
    - region
    - replicas_per_node_group
    - security_group_ids
    - security_group_names
    - snapshot_arns
    - snapshot_name
    - snapshot_retention_limit
    - snapshot_window
    - subnet_group_name
    - tags
    - tags_all
    - transit_encryption_enabled
    - transit_encryption_mode
    - user_group_ids
    - log_delivery_configuration
    - node_group_configuration
EOT

  type = map(object({
    description                 = string
    replication_group_id        = string
    apply_immediately           = optional(bool)
    at_rest_encryption_enabled  = optional(string)
    auth_token                  = optional(string)
    auth_token_update_strategy  = optional(string)
    auth_token_wo               = optional(string)
    auth_token_wo_version       = optional(number)
    auto_minor_version_upgrade  = optional(string)
    automatic_failover_enabled  = optional(bool)
    cluster_mode                = optional(string)
    data_tiering_enabled        = optional(bool)
    durability                  = optional(string)
    engine                      = optional(string)
    engine_version              = optional(string)
    final_snapshot_identifier   = optional(string)
    global_replication_group_id = optional(string)
    ip_discovery                = optional(string)
    kms_key_id                  = optional(string)
    maintenance_window          = optional(string)
    multi_az_enabled            = optional(bool)
    network_type                = optional(string)
    node_type                   = optional(string)
    notification_topic_arn      = optional(string)
    num_cache_clusters          = optional(number)
    num_node_groups             = optional(number)
    parameter_group_name        = optional(string)
    port                        = optional(number)
    preferred_cache_cluster_azs = optional(list(string))
    region                      = optional(string)
    replicas_per_node_group     = optional(number)
    security_group_ids          = optional(set(string))
    security_group_names        = optional(set(string))
    snapshot_arns               = optional(set(string))
    snapshot_name               = optional(string)
    snapshot_retention_limit    = optional(number)
    snapshot_window             = optional(string)
    subnet_group_name           = optional(string)
    tags                        = optional(map(string))
    tags_all                    = optional(map(string))
    transit_encryption_enabled  = optional(bool)
    transit_encryption_mode     = optional(string)
    user_group_ids              = optional(set(string))
    log_delivery_configuration  = optional(set(object({
            destination      = string
            destination_type = string
            log_format       = string
            log_type         = string
        })))
    node_group_configuration    = optional(set(object({
            node_group_id              = optional(string)
            primary_availability_zone  = optional(string)
            primary_outpost_arn        = optional(string)
            replica_availability_zones = optional(list(string))
            replica_count              = optional(number)
            replica_outpost_arns       = optional(list(string))
            slots                      = optional(string)
        })))
  }))
}
