variable "glue_catalog_databases" {
  description = <<EOT
Map of glue_catalog_databases, attributes below
Required:
    - name
Optional:
    - catalog_id
    - description
    - location_uri
    - parameters
    - region
    - tags
    - tags_all
    - create_table_default_permission
    - federated_database
    - target_database
EOT

  type = map(object({
    name                            = string
    catalog_id                      = optional(string)
    description                     = optional(string)
    location_uri                    = optional(string)
    parameters                      = optional(map(string))
    region                          = optional(string)
    tags                            = optional(map(string))
    tags_all                        = optional(map(string))
    create_table_default_permission = optional(list(object({
            permissions = optional(set(string))
            principal   = optional(list(object({
                data_lake_principal_identifier = optional(string)
            })))
        })))
    federated_database              = optional(list(object({
            connection_name = optional(string)
            identifier      = optional(string)
        })))
    target_database                 = optional(list(object({
            catalog_id    = string
            database_name = string
            region        = optional(string)
        })))
  }))
}
