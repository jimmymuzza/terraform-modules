variable "cosmosdb_postgresql_coordinator_configurations" {
  description = <<EOT
Map of cosmosdb_postgresql_coordinator_configurations, attributes below
Required:
    - cluster_id
    - name
    - value
EOT

  type = map(object({
    cluster_id = string
    name       = string
    value      = string
  }))
}
