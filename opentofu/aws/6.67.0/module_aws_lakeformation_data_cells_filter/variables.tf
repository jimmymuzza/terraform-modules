variable "lakeformation_data_cells_filters" {
  description = <<EOT
Map of lakeformation_data_cells_filters, attributes below
Optional:
    - region
    - table_data
EOT

  type = map(object({
    region     = optional(string)
    table_data = optional(list(object({
            database_name    = string
            name             = string
            table_catalog_id = string
            table_name       = string
            column_names     = optional(set(string))
            version_id       = optional(string)
            column_wildcard  = optional(list(object({
                excluded_column_names = optional(set(string))
            })))
            row_filter       = optional(list(object({
                filter_expression = optional(string)
                all_rows_wildcard = optional(list(object({

                })))
            })))
        })))
  }))
}
