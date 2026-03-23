variable "neptunegraph_graphs" {
  description = <<EOT
Map of neptunegraph_graphs, attributes below
Required:
    - provisioned_memory
Optional:
    - deletion_protection
    - graph_name
    - graph_name_prefix
    - kms_key_identifier
    - public_connectivity
    - region
    - replica_count
    - tags
    - vector_search_configuration
EOT

  type = map(object({
    provisioned_memory          = number
    deletion_protection         = optional(bool)
    graph_name                  = optional(string)
    graph_name_prefix           = optional(string)
    kms_key_identifier          = optional(string)
    public_connectivity         = optional(bool)
    region                      = optional(string)
    replica_count               = optional(number)
    tags                        = optional(map(string))
    vector_search_configuration = optional(list(object({
            vector_search_dimension = optional(number)
        })))
  }))
}
