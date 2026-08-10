variable "cosmosdb_mongo_databases" {
  description = <<EOT
Map of cosmosdb_mongo_databases, attributes below
Required:
    - account_name
    - name
    - resource_group_name
Optional:
    - throughput
    - autoscale_settings
EOT

  type = map(object({
    account_name        = string
    name                = string
    resource_group_name = string
    throughput          = optional(number)
    autoscale_settings  = optional(list(object({
            max_throughput = optional(number)
        })))
  }))
}
