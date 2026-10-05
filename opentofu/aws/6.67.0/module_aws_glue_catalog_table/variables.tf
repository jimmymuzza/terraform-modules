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
    - view_definition
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
                metadata_operation  = string
                version             = optional(string)
                iceberg_table_input = optional(list(object({
                    location       = string
                    properties     = optional(map(string))
                    partition_spec = optional(list(object({
                        spec_id = optional(number)
                        fields  = list(object({
                            name      = string
                            source_id = number
                            transform = string
                            field_id  = optional(number)
                        }))
                    })))
                    schema         = list(object({
                        identifier_field_ids = optional(list(number))
                        schema_id            = optional(number)
                        type                 = optional(string)
                        fields               = list(object({
                            name            = string
                            required        = bool
                            type            = string
                            doc             = optional(string)
                            initial_default = optional(string)
                            write_default   = optional(string)
                        }))
                    }))
                    sort_order     = optional(list(object({
                        order_id = number
                        fields   = list(object({
                            direction  = string
                            null_order = string
                            source_id  = number
                            transform  = string
                        }))
                    })))
                })))
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
    view_definition         = optional(list(object({
            definer                = optional(string)
            is_protected           = optional(bool)
            last_refresh_type      = optional(string)
            refresh_seconds        = optional(number)
            sub_object_version_ids = optional(list(number))
            sub_objects            = optional(list(string))
            view_version_id        = optional(number)
            view_version_token     = optional(string)
            representations        = optional(list(object({
                dialect               = optional(string)
                dialect_version       = optional(string)
                validation_connection = optional(string)
                view_expanded_text    = optional(string)
                view_original_text    = optional(string)
            })))
        })))
  }))
}
