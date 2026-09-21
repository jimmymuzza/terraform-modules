variable "data_factory_dataset_jsons" {
  description = <<EOT
Map of data_factory_dataset_jsons, attributes below
Required:
    - data_factory_id
    - linked_service_name
    - name
Optional:
    - additional_properties
    - annotations
    - description
    - encoding
    - folder
    - parameters
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
    description                 = optional(string)
    encoding                    = optional(string)
    folder                      = optional(string)
    parameters                  = optional(map(string))
    azure_blob_storage_location = optional(list(object({
            container                 = string
            filename                  = string
            path                      = string
            dynamic_container_enabled = optional(bool)
            dynamic_filename_enabled  = optional(bool)
            dynamic_path_enabled      = optional(bool)
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
