variable "lakeformation_opt_ins" {
  description = <<EOT
Map of lakeformation_opt_ins, attributes below
Optional:
    - region
    - condition
    - principal
    - resource_data
EOT

  type = map(object({
    region        = optional(string)
    condition     = optional(list(object({

        })))
    principal     = optional(list(object({
            data_lake_principal_identifier = string
        })))
    resource_data = optional(list(object({
            catalog            = optional(list(object({

            })))
            data_cells_filter  = optional(list(object({
                database_name    = optional(string)
                name             = optional(string)
                table_catalog_id = optional(string)
                table_name       = optional(string)
            })))
            data_location      = optional(list(object({
                resource_arn = string
                catalog_id   = optional(string)
            })))
            database           = optional(list(object({
                name       = string
                catalog_id = optional(string)
            })))
            lf_tag             = optional(list(object({
                key        = string
                value      = string
                catalog_id = optional(string)
            })))
            lf_tag_expression  = optional(list(object({
                name       = string
                catalog_id = optional(string)
            })))
            lf_tag_policy      = optional(list(object({
                resource_type   = string
                catalog_id      = optional(string)
                expression      = optional(list(string))
                expression_name = optional(string)
            })))
            table              = optional(list(object({
                database_name = string
                catalog_id    = optional(string)
                name          = optional(string)
                wildcard      = optional(bool)
            })))
            table_with_columns = optional(list(object({
                database_name   = string
                name            = string
                catalog_id      = optional(string)
                column_names    = optional(set(string))
                column_wildcard = optional(list(object({
                    excluded_column_names = optional(set(string))
                })))
            })))
        })))
  }))
}
