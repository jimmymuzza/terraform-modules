variable "elasticache_reserved_cache_nodes" {
  description = <<EOT
Map of elasticache_reserved_cache_nodes, attributes below
Required:
    - reserved_cache_nodes_offering_id
Optional:
    - cache_node_count
    - region
    - tags
EOT

  type = map(object({
    reserved_cache_nodes_offering_id = string
    cache_node_count                 = optional(number)
    region                           = optional(string)
    tags                             = optional(map(string))
  }))
}
