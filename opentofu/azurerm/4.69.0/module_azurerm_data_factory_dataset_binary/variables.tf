variable "data_factory_dataset_binaries" {
  description = <<EOT
Map of data_factory_dataset_binaries, attributes below
Required:
    - data_factory_id
    - linked_service_name
    - name
Optional:
    - additional_properties
    - annotations
    - description
    - folder
    - parameters
    - azure_blob_storage_location
    - compression
    - http_server_location
    - sftp_server_location
EOT

  type = map(object({
    data_factory_id             = string
    linked_service_name         = string
    name                        = string
    additional_properties       = optional(map(string))
    annotations                 = optional(list(string))
    description                 = optional(string)
    folder                      = optional(string)
    parameters                  = optional(map(string))
    azure_blob_storage_location = optional(list(object({
            container                 = string
            dynamic_container_enabled = optional(bool)
            dynamic_filename_enabled  = optional(bool)
            dynamic_path_enabled      = optional(bool)
            filename                  = optional(string)
            path                      = optional(string)
        })))
    compression                 = optional(list(object({
            type  = string
            level = optional(string)
        })))
    http_server_location        = optional(list(object({
            filename                 = string
            path                     = string
            relative_url             = string
            dynamic_filename_enabled = optional(bool)
            dynamic_path_enabled     = optional(bool)
        })))
    sftp_server_location        = optional(list(object({
            filename                 = string
            path                     = string
            dynamic_filename_enabled = optional(bool)
            dynamic_path_enabled     = optional(bool)
        })))
  }))
}
