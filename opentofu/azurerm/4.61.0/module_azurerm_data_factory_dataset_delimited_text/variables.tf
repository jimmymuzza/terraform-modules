variable "data_factory_dataset_delimited_texts" {
  description = <<EOT
Map of data_factory_dataset_delimited_texts, attributes below
Required:
    - data_factory_id
    - linked_service_name
    - name
Optional:
    - additional_properties
    - annotations
    - column_delimiter
    - compression_codec
    - compression_level
    - description
    - encoding
    - escape_character
    - first_row_as_header
    - folder
    - null_value
    - parameters
    - quote_character
    - row_delimiter
    - azure_blob_fs_location
    - azure_blob_storage_location
    - http_server_location
    - schema_column
EOT

  type = map(object({
    data_factory_id             = string
    linked_service_name         = string
    name                        = string
    additional_properties       = optional(map(string))
    annotations                 = optional(list(string))
    column_delimiter            = optional(string)
    compression_codec           = optional(string)
    compression_level           = optional(string)
    description                 = optional(string)
    encoding                    = optional(string)
    escape_character            = optional(string)
    first_row_as_header         = optional(bool)
    folder                      = optional(string)
    null_value                  = optional(string)
    parameters                  = optional(map(string))
    quote_character             = optional(string)
    row_delimiter               = optional(string)
    azure_blob_fs_location      = optional(list(object({
            dynamic_file_system_enabled = optional(bool)
            dynamic_filename_enabled    = optional(bool)
            dynamic_path_enabled        = optional(bool)
            file_system                 = optional(string)
            filename                    = optional(string)
            path                        = optional(string)
        })))
    azure_blob_storage_location = optional(list(object({
            container                 = string
            dynamic_container_enabled = optional(bool)
            dynamic_filename_enabled  = optional(bool)
            dynamic_path_enabled      = optional(bool)
            filename                  = optional(string)
            path                      = optional(string)
        })))
    http_server_location        = optional(list(object({
            filename                 = string
            path                     = string
            relative_url             = string
            dynamic_filename_enabled = optional(bool)
            dynamic_path_enabled     = optional(bool)
        })))
    schema_column               = optional(list(object({
            name        = string
            description = optional(string)
            type        = optional(string)
        })))
  }))
}
