variable "lakeformation_permissions" {
  description = <<EOT
Map of lakeformation_permissions, attributes below
Required:
    - permissions
    - principal
Optional:
    - catalog_id
    - catalog_resource
    - permissions_with_grant_option
    - region
    - data_cells_filter
    - data_location
    - database
    - lf_tag
    - lf_tag_policy
    - table
    - table_with_columns
EOT

  type = map(object({
    permissions                   = set(string)
    principal                     = string
    catalog_id                    = optional(string)
    catalog_resource              = optional(bool)
    permissions_with_grant_option = optional(set(string))
    region                        = optional(string)
    data_cells_filter             = optional(list(object({
            database_name    = string
            name             = string
            table_catalog_id = string
            table_name       = string
        })))
    data_location                 = optional(list(object({
            arn        = string
            catalog_id = optional(string)
        })))
    database                      = optional(list(object({
            name       = string
            catalog_id = optional(string)
        })))
    lf_tag                        = optional(list(object({
            key        = string
            values     = set(string)
            catalog_id = optional(string)
        })))
    lf_tag_policy                 = optional(list(object({
            resource_type = string
            catalog_id    = optional(string)
            expression    = set(object({
                key    = string
                values = set(string)
            }))
        })))
    table                         = optional(list(object({
            database_name = string
            catalog_id    = optional(string)
            name          = optional(string)
            wildcard      = optional(bool)
        })))
    table_with_columns            = optional(list(object({
            database_name         = string
            name                  = string
            catalog_id            = optional(string)
            column_names          = optional(set(string))
            excluded_column_names = optional(set(string))
            wildcard              = optional(bool)
        })))
  }))
}
