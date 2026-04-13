variable "opensearchserverless_collection_groups" {
  description = <<EOT
Map of opensearchserverless_collection_groups, attributes below
Required:
    - name
    - standby_replicas
Optional:
    - capacity_limits
    - description
    - region
    - tags
EOT

  type = map(object({
    name             = string
    standby_replicas = string
    capacity_limits  = optional(list(object({
            max_indexing_capacity_in_ocu = number
            max_search_capacity_in_ocu = number
            min_indexing_capacity_in_ocu = number
            min_search_capacity_in_ocu = number
        })))
    description      = optional(string)
    region           = optional(string)
    tags             = optional(map(string))
  }))
}
