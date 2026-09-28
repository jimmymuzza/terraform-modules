variable "lakeformation_resource_lf_tags" {
  description = <<EOT
Map of lakeformation_resource_lf_tags, attributes below
Required:
    - lf_tag
Optional:
    - catalog_id
    - region
    - database
    - table
    - table_with_columns
EOT

  type = map(object({
    catalog_id         = optional(string)
    region             = optional(string)
    database           = optional(list(object({
            name       = string
            catalog_id = optional(string)
        })))
    lf_tag             = set(object({
            key        = string
            value      = string
            catalog_id = optional(string)
        }))
    table              = optional(list(object({
            database_name = string
            catalog_id    = optional(string)
            name          = optional(string)
            wildcard      = optional(bool)
        })))
    table_with_columns = optional(list(object({
            database_name         = string
            name                  = string
            catalog_id            = optional(string)
            column_names          = optional(set(string))
            excluded_column_names = optional(set(string))
            wildcard              = optional(bool)
        })))
  }))
}
