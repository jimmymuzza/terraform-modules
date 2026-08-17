variable "memorydb_clusters" {
  description = <<EOT
Map of memorydb_clusters, attributes below
Required:
    - acl_name
    - node_type
Optional:
    - auto_minor_version_upgrade
    - data_tiering
    - description
    - engine
    - engine_version
    - final_snapshot_name
    - ip_discovery
    - kms_key_arn
    - maintenance_window
    - multi_region_cluster_name
    - name
    - name_prefix
    - network_type
    - num_replicas_per_shard
    - num_shards
    - parameter_group_name
    - port
    - region
    - security_group_ids
    - snapshot_arns
    - snapshot_name
    - snapshot_retention_limit
    - snapshot_window
    - sns_topic_arn
    - subnet_group_name
    - tags
    - tags_all
    - tls_enabled
EOT

  type = map(object({
    acl_name                   = string
    node_type                  = string
    auto_minor_version_upgrade = optional(bool)
    data_tiering               = optional(bool)
    description                = optional(string)
    engine                     = optional(string)
    engine_version             = optional(string)
    final_snapshot_name        = optional(string)
    ip_discovery               = optional(string)
    kms_key_arn                = optional(string)
    maintenance_window         = optional(string)
    multi_region_cluster_name  = optional(string)
    name                       = optional(string)
    name_prefix                = optional(string)
    network_type               = optional(string)
    num_replicas_per_shard     = optional(number)
    num_shards                 = optional(number)
    parameter_group_name       = optional(string)
    port                       = optional(number)
    region                     = optional(string)
    security_group_ids         = optional(set(string))
    snapshot_arns              = optional(list(string))
    snapshot_name              = optional(string)
    snapshot_retention_limit   = optional(number)
    snapshot_window            = optional(string)
    sns_topic_arn              = optional(string)
    subnet_group_name          = optional(string)
    tags                       = optional(map(string))
    tags_all                   = optional(map(string))
    tls_enabled                = optional(bool)
  }))
}
