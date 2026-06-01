variable "cosmosdb_postgresql_roles" {
  description = <<EOT
Map of cosmosdb_postgresql_roles, attributes below
Required:
    - cluster_id
    - name
    - password
EOT

  type = map(object({
    cluster_id = string
    name       = string
    password   = string
  }))
}
