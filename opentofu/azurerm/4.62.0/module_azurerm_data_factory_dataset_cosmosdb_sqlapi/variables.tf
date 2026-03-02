variable "data_factory_dataset_cosmosdb_sqlapis" {
  description = <<EOT
Map of data_factory_dataset_cosmosdb_sqlapis, attributes below
Required:
    - data_factory_id
    - linked_service_name
    - name
Optional:
    - additional_properties
    - annotations
    - collection_name
    - description
    - folder
    - parameters
    - schema_column
EOT

  type = map(object({
    data_factory_id       = string
    linked_service_name   = string
    name                  = string
    additional_properties = optional(map(string))
    annotations           = optional(list(string))
    collection_name       = optional(string)
    description           = optional(string)
    folder                = optional(string)
    parameters            = optional(map(string))
    schema_column         = optional(list(object({
            name        = string
            description = optional(string)
            type        = optional(string)
        })))
  }))
}
