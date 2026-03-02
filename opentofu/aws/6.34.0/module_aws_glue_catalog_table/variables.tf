variable "glue_catalog_tables" {
  description = <<EOT
Map of glue_catalog_tables, attributes below
Required:
    - database_name
    - name
Optional:
    - catalog_id
    - description
    - owner
    - parameters
    - region
    - retention
    - table_type
    - view_expanded_text
    - view_original_text
    - open_table_format_input
    - partition_index
    - partition_keys
    - storage_descriptor
    - target_table
EOT

  type = map(object({
    database_name           = string
    name                    = string
    catalog_id              = optional(string)
    description             = optional(string)
    owner                   = optional(string)
    parameters              = optional(map(string))
    region                  = optional(string)
    retention               = optional(number)
    table_type              = optional(string)
    view_expanded_text      = optional(string)
    view_original_text      = optional(string)
    open_table_format_input = optional(list(object({
            iceberg_input = list(object({
                metadata_operation = string
                version            = optional(string)
            }))
        })))
    partition_index         = optional(list(object({
            index_name = string
            keys       = list(string)
        })))
    partition_keys          = optional(list(object({
            name       = string
            comment    = optional(string)
            parameters = optional(map(string))
            type       = optional(string)
        })))
    storage_descriptor      = optional(list(object({
            additional_locations      = optional(list(string))
            bucket_columns            = optional(list(string))
            compressed                = optional(bool)
            input_format              = optional(string)
            location                  = optional(string)
            number_of_buckets         = optional(number)
            output_format             = optional(string)
            parameters                = optional(map(string))
            stored_as_sub_directories = optional(bool)
            columns                   = optional(list(object({
                name       = string
                comment    = optional(string)
                parameters = optional(map(string))
                type       = optional(string)
            })))
            schema_reference          = optional(list(object({
                schema_version_number = number
                schema_version_id     = optional(string)
                schema_id             = optional(list(object({
                    registry_name = optional(string)
                    schema_arn    = optional(string)
                    schema_name   = optional(string)
                })))
            })))
            ser_de_info               = optional(list(object({
                name                  = optional(string)
                parameters            = optional(map(string))
                serialization_library = optional(string)
            })))
            skewed_info               = optional(list(object({
                skewed_column_names               = optional(list(string))
                skewed_column_value_location_maps = optional(map(string))
                skewed_column_values              = optional(list(string))
            })))
            sort_columns              = optional(list(object({
                column     = string
                sort_order = number
            })))
        })))
    target_table            = optional(list(object({
            catalog_id    = string
            database_name = string
            name          = string
            region        = optional(string)
        })))
  }))
}
