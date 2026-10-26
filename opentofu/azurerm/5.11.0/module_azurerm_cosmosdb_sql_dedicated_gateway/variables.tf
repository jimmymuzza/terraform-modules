variable "cosmosdb_sql_dedicated_gateways" {
  description = <<EOT
Map of cosmosdb_sql_dedicated_gateways, attributes below
Required:
    - cosmosdb_account_id
    - instance_count
    - instance_size
EOT

  type = map(object({
    cosmosdb_account_id = string
    instance_count      = number
    instance_size       = string
  }))
}
