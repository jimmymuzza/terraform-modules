variable "cosmosdb_mongo_user_definitions" {
  description = <<EOT
Map of cosmosdb_mongo_user_definitions, attributes below
Required:
    - cosmos_mongo_database_id
    - password
    - username
Optional:
    - inherited_role_names
EOT

  type = map(object({
    cosmos_mongo_database_id = string
    password                 = string
    username                 = string
    inherited_role_names     = optional(list(string))
  }))
}
