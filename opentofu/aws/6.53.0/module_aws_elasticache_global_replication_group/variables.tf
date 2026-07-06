variable "elasticache_global_replication_groups" {
  description = <<EOT
Map of elasticache_global_replication_groups, attributes below
Required:
    - global_replication_group_id_suffix
    - primary_replication_group_id
Optional:
    - automatic_failover_enabled
    - cache_node_type
    - engine
    - engine_version
    - global_replication_group_description
    - num_node_groups
    - parameter_group_name
    - region
EOT

  type = map(object({
    global_replication_group_id_suffix   = string
    primary_replication_group_id         = string
    automatic_failover_enabled           = optional(bool)
    cache_node_type                      = optional(string)
    engine                               = optional(string)
    engine_version                       = optional(string)
    global_replication_group_description = optional(string)
    num_node_groups                      = optional(number)
    parameter_group_name                 = optional(string)
    region                               = optional(string)
  }))
}
