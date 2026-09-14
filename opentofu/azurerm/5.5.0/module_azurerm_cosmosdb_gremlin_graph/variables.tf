variable "cosmosdb_gremlin_graphs" {
  description = <<EOT
Map of cosmosdb_gremlin_graphs, attributes below
Required:
    - account_name
    - database_name
    - name
    - partition_key_path
    - resource_group_name
Optional:
    - analytical_storage_ttl
    - default_ttl
    - partition_key_version
    - throughput
    - autoscale_settings
    - conflict_resolution_policy
    - index_policy
    - unique_key
EOT

  type = map(object({
    account_name               = string
    database_name              = string
    name                       = string
    partition_key_path         = string
    resource_group_name        = string
    analytical_storage_ttl     = optional(number)
    default_ttl                = optional(number)
    partition_key_version      = optional(number)
    throughput                 = optional(number)
    autoscale_settings         = optional(list(object({
            max_throughput = optional(number)
        })))
    conflict_resolution_policy = optional(list(object({
            mode                          = string
            conflict_resolution_path      = optional(string)
            conflict_resolution_procedure = optional(string)
        })))
    index_policy               = optional(list(object({
            indexing_mode   = string
            automatic       = optional(bool)
            excluded_paths  = optional(set(string))
            included_paths  = optional(set(string))
            composite_index = optional(list(object({
                index = list(object({
                    order = string
                    path  = string
                }))
            })))
            spatial_index   = optional(list(object({
                path = string
            })))
        })))
    unique_key                 = optional(set(object({
            paths = set(string)
        })))
  }))
}
