variable "cosmosdb_cassandra_tables" {
  description = <<EOT
Map of cosmosdb_cassandra_tables, attributes below
Required:
    - cassandra_keyspace_id
    - name
    - schema
Optional:
    - analytical_storage_ttl
    - default_ttl
    - throughput
    - autoscale_settings
EOT

  type = map(object({
    cassandra_keyspace_id  = string
    name                   = string
    analytical_storage_ttl = optional(number)
    default_ttl            = optional(number)
    throughput             = optional(number)
    autoscale_settings     = optional(list(object({
            max_throughput = optional(number)
        })))
    schema                 = list(object({
            cluster_key   = optional(list(object({
                name     = string
                order_by = string
            })))
            column        = list(object({
                name = string
                type = string
            }))
            partition_key = list(object({
                name = string
            }))
        }))
  }))
}
