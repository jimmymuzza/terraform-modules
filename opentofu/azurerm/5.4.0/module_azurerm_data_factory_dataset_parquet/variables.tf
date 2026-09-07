variable "data_factory_dataset_parquets" {
  description = <<EOT
Map of data_factory_dataset_parquets, attributes below
Required:
    - data_factory_id
    - linked_service_name
    - name
Optional:
    - additional_properties
    - annotations
    - compression_codec
    - compression_level
    - description
    - folder
    - parameters
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
    compression_codec           = optional(string)
    compression_level           = optional(string)
    description                 = optional(string)
    folder                      = optional(string)
    parameters                  = optional(map(string))
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
            relative_url             = string
            dynamic_filename_enabled = optional(bool)
            dynamic_path_enabled     = optional(bool)
            path                     = optional(string)
        })))
    schema_column               = optional(list(object({
            name        = string
            description = optional(string)
            type        = optional(string)
        })))
  }))
}
