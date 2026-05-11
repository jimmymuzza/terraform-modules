variable "cosmosdb_mongo_collections" {
  description = <<EOT
Map of cosmosdb_mongo_collections, attributes below
Required:
    - account_name
    - database_name
    - name
    - resource_group_name
Optional:
    - analytical_storage_ttl
    - default_ttl_seconds
    - shard_key
    - throughput
    - autoscale_settings
    - index
EOT

  type = map(object({
    account_name           = string
    database_name          = string
    name                   = string
    resource_group_name    = string
    analytical_storage_ttl = optional(number)
    default_ttl_seconds    = optional(number)
    shard_key              = optional(string)
    throughput             = optional(number)
    autoscale_settings     = optional(list(object({
            max_throughput = optional(number)
        })))
    index                  = optional(set(object({
            keys   = list(string)
            unique = optional(bool)
        })))
  }))
}
