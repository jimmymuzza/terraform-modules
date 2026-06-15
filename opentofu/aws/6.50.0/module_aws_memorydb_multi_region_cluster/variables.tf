variable "memorydb_multi_region_clusters" {
  description = <<EOT
Map of memorydb_multi_region_clusters, attributes below
Required:
    - multi_region_cluster_name_suffix
    - node_type
Optional:
    - description
    - engine
    - engine_version
    - multi_region_parameter_group_name
    - num_shards
    - region
    - tags
    - tls_enabled
    - update_strategy
EOT

  type = map(object({
    multi_region_cluster_name_suffix  = string
    node_type                         = string
    description                       = optional(string)
    engine                            = optional(string)
    engine_version                    = optional(string)
    multi_region_parameter_group_name = optional(string)
    num_shards                        = optional(number)
    region                            = optional(string)
    tags                              = optional(map(string))
    tls_enabled                       = optional(bool)
    update_strategy                   = optional(string)
  }))
}
