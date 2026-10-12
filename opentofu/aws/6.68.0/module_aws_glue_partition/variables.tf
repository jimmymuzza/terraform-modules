variable "glue_partitions" {
  description = <<EOT
Map of glue_partitions, attributes below
Required:
    - database_name
    - partition_values
    - table_name
Optional:
    - catalog_id
    - parameters
    - region
    - storage_descriptor
EOT

  type = map(object({
    database_name      = string
    partition_values   = list(string)
    table_name         = string
    catalog_id         = optional(string)
    parameters         = optional(map(string))
    region             = optional(string)
    storage_descriptor = optional(list(object({
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
                name    = string
                comment = optional(string)
                type    = optional(string)
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
  }))
}
