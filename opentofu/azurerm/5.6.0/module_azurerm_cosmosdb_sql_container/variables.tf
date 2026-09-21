variable "cosmosdb_sql_containers" {
  description = <<EOT
Map of cosmosdb_sql_containers, attributes below
Required:
    - account_name
    - database_name
    - name
    - partition_key_paths
    - resource_group_name
Optional:
    - analytical_storage_ttl
    - default_ttl
    - partition_key_kind
    - partition_key_version
    - throughput
    - autoscale_settings
    - conflict_resolution_policy
    - indexing_policy
    - unique_key
EOT

  type = map(object({
    account_name               = string
    database_name              = string
    name                       = string
    partition_key_paths        = list(string)
    resource_group_name        = string
    analytical_storage_ttl     = optional(number)
    default_ttl                = optional(number)
    partition_key_kind         = optional(string)
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
    indexing_policy            = optional(list(object({
            indexing_mode   = optional(string)
            composite_index = optional(list(object({
                index = list(object({
                    order = string
                    path  = string
                }))
            })))
            excluded_path   = optional(list(object({
                path = string
            })))
            included_path   = optional(list(object({
                path = string
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
