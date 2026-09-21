variable "elasticache_clusters" {
  description = <<EOT
Map of elasticache_clusters, attributes below
Required:
    - cluster_id
Optional:
    - apply_immediately
    - auto_minor_version_upgrade
    - availability_zone
    - az_mode
    - engine
    - engine_version
    - final_snapshot_identifier
    - ip_discovery
    - maintenance_window
    - network_type
    - node_type
    - notification_topic_arn
    - num_cache_nodes
    - outpost_mode
    - parameter_group_name
    - port
    - preferred_availability_zones
    - preferred_outpost_arn
    - region
    - replication_group_id
    - security_group_ids
    - snapshot_arns
    - snapshot_name
    - snapshot_retention_limit
    - snapshot_window
    - subnet_group_name
    - tags
    - tags_all
    - transit_encryption_enabled
    - log_delivery_configuration
EOT

  type = map(object({
    cluster_id                   = string
    apply_immediately            = optional(bool)
    auto_minor_version_upgrade   = optional(string)
    availability_zone            = optional(string)
    az_mode                      = optional(string)
    engine                       = optional(string)
    engine_version               = optional(string)
    final_snapshot_identifier    = optional(string)
    ip_discovery                 = optional(string)
    maintenance_window           = optional(string)
    network_type                 = optional(string)
    node_type                    = optional(string)
    notification_topic_arn       = optional(string)
    num_cache_nodes              = optional(number)
    outpost_mode                 = optional(string)
    parameter_group_name         = optional(string)
    port                         = optional(number)
    preferred_availability_zones = optional(list(string))
    preferred_outpost_arn        = optional(string)
    region                       = optional(string)
    replication_group_id         = optional(string)
    security_group_ids           = optional(set(string))
    snapshot_arns                = optional(list(string))
    snapshot_name                = optional(string)
    snapshot_retention_limit     = optional(number)
    snapshot_window              = optional(string)
    subnet_group_name            = optional(string)
    tags                         = optional(map(string))
    tags_all                     = optional(map(string))
    transit_encryption_enabled   = optional(bool)
    log_delivery_configuration   = optional(set(object({
            destination      = string
            destination_type = string
            log_format       = string
            log_type         = string
        })))
  }))
}
